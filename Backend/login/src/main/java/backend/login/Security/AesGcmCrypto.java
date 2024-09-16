package backend.login.Security;
import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.GCMParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;
import java.nio.charset.StandardCharsets;
import java.security.SecureRandom;
import java.security.spec.KeySpec;
import java.util.Base64;
import java.util.logging.Level;
import java.util.logging.Logger;

    public class AesGcmCrypto {

        private static final Logger logger = Logger.getLogger(AesGcmCrypto.class.getName());
        private static final int KEY_SIZE = 256; // 256-bit key
        private static final int SALT_SIZE = 32; // Salt size for key derivation
        private static final String SECRET_KEY_FACTORY_ALGORITHM = "PBKDF2WithHmacSHA256";
        private static final String CIPHER_TRANSFORMATION = "AES/GCM/NoPadding";

        public String encrypt(String data, String password) throws Exception {
            // Generate a random salt
            byte[] salt = new byte[SALT_SIZE];
            new SecureRandom().nextBytes(salt);

            // Derive a secret key from the password and salt
            KeySpec spec = new PBEKeySpec(password.toCharArray(), salt, 65536, KEY_SIZE);
            SecretKeyFactory factory = SecretKeyFactory.getInstance(SECRET_KEY_FACTORY_ALGORITHM);
            SecretKey secret = new SecretKeySpec(factory.generateSecret(spec).getEncoded(), "AES");

            // Generate a random initialization vector (IV)
            byte[] iv = new byte[Cipher.getInstance(CIPHER_TRANSFORMATION).getBlockSize()];
            new SecureRandom().nextBytes(iv);

            // Create a Cipher instance for encryption
            Cipher cipher = Cipher.getInstance(CIPHER_TRANSFORMATION);
            cipher.init(Cipher.ENCRYPT_MODE, secret, new GCMParameterSpec(128, iv));

            // Encrypt the data
            byte[] encryptedData = cipher.doFinal(data.getBytes(StandardCharsets.UTF_8));

            // Combine salt, IV and encrypted data for storage/transmission
            byte[] combinedData = new byte[salt.length + iv.length + encryptedData.length];
            System.arraycopy(salt, 0, combinedData, 0, salt.length);
            System.arraycopy(iv, 0, combinedData, salt.length, iv.length);
            System.arraycopy(encryptedData, 0, combinedData, salt.length + iv.length, encryptedData.length);

            // Base64 encode the combined data for easier storage/transmission
            return Base64.getEncoder().encodeToString(combinedData);
        }

        public String decrypt(String encryptedData, String password) throws Exception {
            // Extract salt, IV and encrypted data from the combined data
            byte[] combinedData = Base64.getDecoder().decode(encryptedData);
            byte[] salt = new byte[SALT_SIZE];
            byte[] iv = new byte[Cipher.getInstance(CIPHER_TRANSFORMATION).getBlockSize()];
            byte[] encryptedBytes = new byte[combinedData.length - salt.length - iv.length];
            System.arraycopy(combinedData, 0, salt, 0, salt.length);
            System.arraycopy(combinedData, salt.length, iv, 0, iv.length);
            System.arraycopy(combinedData, salt.length + iv.length, encryptedBytes, 0, encryptedBytes.length);

            // Derive the secret key from the password and salt
            KeySpec spec = new PBEKeySpec(password.toCharArray(), salt, 65536, KEY_SIZE);
            SecretKeyFactory factory = SecretKeyFactory.getInstance(SECRET_KEY_FACTORY_ALGORITHM);
            SecretKey secret = new SecretKeySpec(factory.generateSecret(spec).getEncoded(), "AES");

            // Create a Cipher instance for decryption
            Cipher cipher = Cipher.getInstance(CIPHER_TRANSFORMATION);
            cipher.init(Cipher.DECRYPT_MODE, secret, new GCMParameterSpec(128, iv));

            // Decrypt the data
            byte[] plainText = cipher.doFinal(encryptedBytes);

            // Return the decrypted String
            return new String(plainText, StandardCharsets.UTF_8);
        }

        // Add error handling with try-catch block for decryption
        public String decryptWithLogging(String encryptedData, String password) {
            try {
                return decrypt(encryptedData, password);
            } catch (Exception e) {
                logger.log(Level.SEVERE, "Decryption failed", e);
                return null; // Or throw a custom exception
            }
        }
    }
