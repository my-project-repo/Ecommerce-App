package backend.login.Security;

public class SecurityServices {
    private AesGcmCrypto sec = new AesGcmCrypto();
    private final String password = "AESImran99";

    public SecurityServices()throws Exception {
    }

    public String encrypt(String data) throws Exception {
        return sec.encrypt(data,password);
    }
    public String decrypt(String data) throws Exception {
        return sec.decrypt(data,password);
    }
}
