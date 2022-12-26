public class SmartTv {
    Boolean ligada = false;
    Integer canal = 1;
    Integer volume = 25;

    public void aumentarVolume(){
        while (volume < 27){
            volume++;
            System.out.println("Novo Status -> Tv aumentar volume: " + volume + "\n--------------------------------------------------");
        }
        
    }

    public void mudarDeCanal(int novoCanal){
        canal = novoCanal;
    }

    public void diminuirVolume(){
            volume--;
            System.out.println("Novo Status -> Tv diminuir volume: " + volume);
        }
    
    public void aumentarCanal(){
        canal++;
        System.out.println("Novo Status -> Tv aumentar Canal: " + canal);
    }    
        
    public void diminuirCanal(){
        canal--;
        System.out.println("Novo Status -> Tv diminuir Canal: " + canal);
    }

    public void ligar(){
        ligada =true;
    }

    public void desligar(){
        ligada =false;
    }


}
