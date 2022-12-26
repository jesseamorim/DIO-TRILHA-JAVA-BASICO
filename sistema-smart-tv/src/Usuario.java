public class Usuario {
    public static void main(String[] args) throws Exception {
        
        SmartTv smartTv = new SmartTv();

        System.out.println("Tv ligada ? " + smartTv.ligada);
        
        smartTv.ligar();
        
        System.out.println("Novo Status -> Tv ligada ? " + smartTv.ligada); 
        
        System.out.println("Volume atual ? " + smartTv.volume);
        smartTv.aumentarVolume();
        
        smartTv.diminuirVolume();
        
        System.out.println("Canal atual ? " + smartTv.canal);
        
        smartTv.aumentarCanal();
        smartTv.aumentarCanal();
        smartTv.aumentarCanal();
        System.out.println("Canal atual ? " + smartTv.canal);

        smartTv.mudarDeCanal(15);

        System.out.println("Canal atual ? " + smartTv.canal);

        smartTv.diminuirCanal();
      
    }
}
