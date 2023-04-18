
#property copyright "Copyright © 2023, Jesse"
#property link      "https://t.me/Jesseamorim"
#property version   "1.0"
#property description "Mr Profit FullTime" 
#property description "JUST OPEN (USDCAD ONLY)" 
#property description "TF: M5" 
//#property description "END ON 17 DEC"
#property icon        "\\Images\\MrProfit.ico"
#property strict
//+------------------------------------------------------------------+
//extern string    TypeTime ="END ON 17 DEC"; // DEMO
extern string    Settings ="FullTime"; //SETTINGS
extern string    Tf ="M5"; // TF
extern string    Note="Not for backtester"; // NOTE
input double StopLossProcent   =0;  // SL AS DD%
input double Risk              =1;  //RISK
input double lucro_maximo_percentual = 2.0; // Lucro em Porcentagem
input double perda_maxima_percentual = 1.0; // Perda em Porcentagem
bool estrategia_ativa = true;
 bool   UseLotManual      =false;
 double ManualLot         =0.01;
input int    ProfitPips        =25;   // TP
 int    TimeFrame         =5;
 input string pUSDCAD           ="USDCAD"; // SYMBOL 1
 int    pUSDCAD_StepM     =50;
 int    pUSDCAD_StepP     =50;
input string pEURUSD           ="EURUSD"; // SYMBOL 2
 int    pEURUSD_StepM     =50;
 int    pEURUSD_StepP     =50;
input string pGBPUSD           ="GBPUSD"; // SYMBOL 3
 int    pGBPUSD_StepM     =50;
 int    pGBPUSD_StepP     =50;
input string pAUDUSD           ="AUDUSD"; // SYMBOL 4
 int    pAUDUSD_StepM     =50;
 int    pAUDUSD_StepP     =50;
input string pNZDUSD           ="NZDUSD"; // SYMBOL 5
 int    pNZDUSD_StepM     =50;
 int    pNZDUSD_StepP     =50;
input string pUSDJPY           ="USDJPY"; // SYMBOL 6
 int    pUSDJPY_StepM     =50;
 int    pUSDJPY_StepP     =50;
input string pUSDCHF           ="USDCHF"; // SYMBOL 7
 int    pUSDCHF_StepM     =50;
 int    pUSDCHF_StepP     =50;
input string pEURJPY           ="EURJPY";  // SYMBOL 8
 int    pEURJPY_StepM     =50;
 int    pEURJPY_StepP     =50;
input string pGBPJPY           ="GBPJPY";  // SYMBOL 9
 int    pGBPJPY_StepM     =50;
 int    pGBPJPY_StepP     =50;
 int    MaxOrders         =100;
double TimeStart         =1;  
double TimeEnd           =23; 
input string MobClosPair       ="EURGBP"; // SYMBOL 10
 int    SpeedEA           =50;
input int    Magic             =99999999;   // MAGIC NUMBER
 bool   UseUPlot          =false; 
//+------------------------------------------------------------------+
string comment = "By: TESTE PARA FECHAMENTO DE ALVOS";
int BWidth   = 65;
int BHeigh   = 25; 
color  TXTButton         =Red;     
color  ClickButton       =Black;
color  FonButtonInfo     =White;
color  FonButtonBuy      =Blue;  
color  FonButtonSell     =Red;
color  TextButtonBS      =White;
color  FonButton         =White;
color  TextColor         =White;  
color  ButtonBorder      =Blue;
color  InfoDataColor     =Red;  
color  InfoDataColorText =Red;  
color  EditColor         =Black; 
color  FonColor          =Black;
int    FontSize          =7;
int    FontSizeInfo      =7;  
int o;
double Lot_1          =0;
double Lot_2          =0;
double Lot_3          =0;
double Lot_4          =0;
double Lot_5          =0;
double Lot_6          =0;
double Lot_7          =0;
double Lot_8          =0;
double Lot_9          =0;
int D_1,D_2,D_3,D_4,D_5,D_6,D_7,D_8,D_9;
int dig_1,dig_2,dig_3,dig_4,dig_5,dig_6,dig_7,dig_8,dig_9;
static double price_1 =0;
static double price_2 =0;
static double price_3 =0;
static double price_4 =0;
static double price_5 =0;
static double price_6 =0;
static double price_7 =0;
static double price_8 =0;
static double price_9 =0;
static double TimeClose =0;
double SizeBar_1, SizeBar_2, SizeBar_3, SizeBar_4, SizeBar_5, SizeBar_6, SizeBar_7, SizeBar_8, SizeBar_9;
string PairName;
string TextOn;
string TextOff;
string Ai_1 = "2024.04.18";
//+------------------------------------------------------------------+
bool   Demo             =true;
int    AccNumber        =0;
bool   LimitLicense     =true;
int    DeyLicense       =1;
int    DeyLimit         =1;
//+------------------------------------------------------------------+
// Função para fechar todas as posições abertas
void CloseAllPositions()
{
    // Percorre todas as posições abertas
    for (int i=OrdersTotal()-1; i>=0; i--) {
        if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES)) {
            // Fecha a posição
            if (OrderClose(OrderTicket(), OrderLots(), Bid, 5, Red)) {
                Print("Posição fechada com sucesso: ticket ", OrderTicket());
            } else {
                Print("Erro ao fechar a posição: ", GetLastError());
            }
        }
    }
}


int OnInit()
  {
   EventSetMillisecondTimer(SpeedEA);
   
D_1=1;
if (MarketInfo(pEURUSD,MODE_DIGITS)==5 || MarketInfo(pEURUSD,MODE_DIGITS)==3)
{D_1=10;}

D_2=1;
if (MarketInfo(pGBPUSD,MODE_DIGITS)==5 || MarketInfo(pGBPUSD,MODE_DIGITS)==3)
{D_2=10;}

D_3=1;
if (MarketInfo(pAUDUSD,MODE_DIGITS)==5 || MarketInfo(pAUDUSD,MODE_DIGITS)==3)
{D_3=10;}

D_4=1;
if (MarketInfo(pNZDUSD,MODE_DIGITS)==5 || MarketInfo(pNZDUSD,MODE_DIGITS)==3)
{D_4=10;}

D_5=1;
if (MarketInfo(pUSDJPY,MODE_DIGITS)==5 || MarketInfo(pUSDJPY,MODE_DIGITS)==3)
{D_5=10;}

D_6=1;
if (MarketInfo(pUSDCAD,MODE_DIGITS)==5 || MarketInfo(pUSDCAD,MODE_DIGITS)==3)
{D_6=10;}

D_7=1;
if (MarketInfo(pUSDCHF,MODE_DIGITS)==5 || MarketInfo(pUSDCHF,MODE_DIGITS)==3)
{D_7=10;}

D_8=1;
if (MarketInfo(pEURJPY,MODE_DIGITS)==5 || MarketInfo(pEURJPY,MODE_DIGITS)==3)
{D_8=10;}

D_9=1;
if (MarketInfo(pGBPJPY,MODE_DIGITS)==5 || MarketInfo(pGBPJPY,MODE_DIGITS)==3)
{D_9=10;}

   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
   ObjectsDeleteAll(0,OBJ_LABEL);
   EventKillTimer();
   ObjectsDeleteAll(0,OBJ_BUTTON);
   ObjectsDeleteAll(0,OBJ_EDIT);
   ObjectsDeleteAll(0,OBJ_RECTANGLE_LABEL);
   
  }
  int start()
  {
  int mooo = StrToTime(Ai_1);
   if (TimeCurrent() >= mooo) {
      Alert("O EA expirou!");
      ExpertRemove();
      return (0);
   }
   return(0);
  }
//+------------------------------------------------------------------+
void OnTick()
{
   if (Period() != PERIOD_M5) {
      Alert("EA FUNCIONA APENAS NO M5 TIMEFRAME ");
   }

ChartSetInteger(ChartID(),CHART_SHOW_GRID,0);
ChartSetInteger(ChartID(),CHART_MODE,CHART_CANDLES);
  
int mooo = StrToTime(Ai_1);
   if (TimeCurrent() >= mooo) {
      Alert("O EA expirou!");
      ExpertRemove();
   }
   if (!estrategia_ativa) {
        return; // Encerra a função sem executar nada
    }
   
string P_1,P_2,P_3,P_4,P_5,P_6,P_7,P_8,P_9;

if(IsTesting())
{P_1=Symbol();
 P_2=Symbol();
 P_3=Symbol();
 P_4=Symbol();
 P_5=Symbol();
 P_6=Symbol();
 P_7=Symbol();
 P_8=Symbol();
 P_9=Symbol();}
else
{P_1=pEURUSD;
 P_2=pGBPUSD;
 P_3=pAUDUSD;
 P_4=pNZDUSD;
 P_5=pUSDJPY;
 P_6=pUSDCAD;
 P_7=pUSDCHF;
 P_8=pEURJPY;
 P_9=pGBPJPY;}
//=======================
if(AccNumber>0 && AccountNumber()!=AccNumber) 
{
Alert("COLOQUE A CONTA VERIFICADA!");
      ExpertRemove();
}
else
{
//----------------
if(Demo && IsDemo()==false)
{
}
//==============================
if(!Demo || (Demo && IsDemo()==true))
{
//+------------------------------------------------------------------+
if(UseLotManual)
{
 Lot_1=ManualLot;
 Lot_2=ManualLot;
 Lot_3=ManualLot;
 Lot_4=ManualLot;
 Lot_5=ManualLot;
 Lot_6=ManualLot;
 Lot_7=ManualLot;
 Lot_8=ManualLot;
 Lot_9=ManualLot;
 }
else
{
//--- 1
if(MarketInfo(P_1,MODE_LOTSTEP)==0.01)     dig_1 =2;
if(MarketInfo(P_1,MODE_LOTSTEP)==0.10)     dig_1 =1;
if(MarketInfo(P_1,MODE_LOTSTEP)==1.00)     dig_1 =0;

Lot_1=NormalizeDouble(AccountBalance()/100*Risk/(MarketInfo(P_1,MODE_TICKVALUE)*100*D_1),dig_1);
if(Lot_1<MarketInfo(P_1,MODE_MINLOT)) {Lot_1=MarketInfo(P_1,MODE_MINLOT);} 
if(Lot_1>=MarketInfo(P_1,MODE_MAXLOT)) {Lot_1=MarketInfo(P_1,MODE_MAXLOT);}
//--- 2
if(MarketInfo(P_2,MODE_LOTSTEP)==0.01)     dig_2 =2;
if(MarketInfo(P_2,MODE_LOTSTEP)==0.10)     dig_2 =1;
if(MarketInfo(P_2,MODE_LOTSTEP)==1.00)     dig_2 =0;

Lot_2=NormalizeDouble(AccountBalance()/100*Risk/(MarketInfo(P_2,MODE_TICKVALUE)*100*D_2),dig_2);
if(Lot_2<MarketInfo(P_2,MODE_MINLOT)) {Lot_2=MarketInfo(P_2,MODE_MINLOT);} 
if(Lot_2>=MarketInfo(P_2,MODE_MAXLOT)) {Lot_2=MarketInfo(P_2,MODE_MAXLOT);}
//--- 3
if(MarketInfo(P_3,MODE_LOTSTEP)==0.01)     dig_3 =2;
if(MarketInfo(P_3,MODE_LOTSTEP)==0.10)     dig_3 =1;
if(MarketInfo(P_3,MODE_LOTSTEP)==1.00)     dig_3 =0;

Lot_3=NormalizeDouble(AccountBalance()/100*Risk/(MarketInfo(P_3,MODE_TICKVALUE)*100*D_3),dig_3);
if(Lot_3<MarketInfo(P_3,MODE_MINLOT)) {Lot_3=MarketInfo(P_3,MODE_MINLOT);} 
if(Lot_3>=MarketInfo(P_3,MODE_MAXLOT)) {Lot_3=MarketInfo(P_3,MODE_MAXLOT);}
//--- 4
if(MarketInfo(P_4,MODE_LOTSTEP)==0.01)     dig_4 =2;
if(MarketInfo(P_4,MODE_LOTSTEP)==0.10)     dig_4 =1;
if(MarketInfo(P_4,MODE_LOTSTEP)==1.00)     dig_4 =0;

Lot_4=NormalizeDouble(AccountBalance()/100*Risk/(MarketInfo(P_4,MODE_TICKVALUE)*100*D_4),dig_4);
if(Lot_4<MarketInfo(P_4,MODE_MINLOT)) {Lot_4=MarketInfo(P_4,MODE_MINLOT);} 
if(Lot_4>=MarketInfo(P_4,MODE_MAXLOT)) {Lot_4=MarketInfo(P_4,MODE_MAXLOT);}
//--- 5
if(MarketInfo(P_5,MODE_LOTSTEP)==0.01)     dig_5 =2;
if(MarketInfo(P_5,MODE_LOTSTEP)==0.10)     dig_5 =1;
if(MarketInfo(P_5,MODE_LOTSTEP)==1.00)     dig_5 =0;

Lot_5=NormalizeDouble(AccountBalance()/100*Risk/(MarketInfo(P_5,MODE_TICKVALUE)*100*D_5),dig_5);
if(Lot_5<MarketInfo(P_5,MODE_MINLOT)) {Lot_5=MarketInfo(P_5,MODE_MINLOT);} 
if(Lot_5>=MarketInfo(P_5,MODE_MAXLOT)) {Lot_5=MarketInfo(P_5,MODE_MAXLOT);}
//--- 6
if(MarketInfo(P_6,MODE_LOTSTEP)==0.01)     dig_6 =2;
if(MarketInfo(P_6,MODE_LOTSTEP)==0.10)     dig_6 =1;
if(MarketInfo(P_6,MODE_LOTSTEP)==1.00)     dig_6 =0;

Lot_6=NormalizeDouble(AccountBalance()/100*Risk/(MarketInfo(P_6,MODE_TICKVALUE)*100*D_6),dig_6);
if(Lot_6<MarketInfo(P_6,MODE_MINLOT)) {Lot_6=MarketInfo(P_6,MODE_MINLOT);} 
if(Lot_6>=MarketInfo(P_6,MODE_MAXLOT)) {Lot_6=MarketInfo(P_6,MODE_MAXLOT);}
//--- 7
if(MarketInfo(P_7,MODE_LOTSTEP)==0.01)     dig_7 =2;
if(MarketInfo(P_7,MODE_LOTSTEP)==0.10)     dig_7 =1;
if(MarketInfo(P_7,MODE_LOTSTEP)==1.00)     dig_7 =0;

Lot_7=NormalizeDouble(AccountBalance()/100*Risk/(MarketInfo(P_7,MODE_TICKVALUE)*100*D_7),dig_7);
if(Lot_7<MarketInfo(P_7,MODE_MINLOT)) {Lot_7=MarketInfo(P_7,MODE_MINLOT);} 
if(Lot_7>=MarketInfo(P_7,MODE_MAXLOT)) {Lot_7=MarketInfo(P_7,MODE_MAXLOT);}
//--- 8
if(MarketInfo(P_8,MODE_LOTSTEP)==0.01)     dig_8 =2;
if(MarketInfo(P_8,MODE_LOTSTEP)==0.10)     dig_8 =1;
if(MarketInfo(P_8,MODE_LOTSTEP)==1.00)     dig_8 =0;

Lot_8=NormalizeDouble(AccountBalance()/100*Risk/(MarketInfo(P_8,MODE_TICKVALUE)*100*D_8),dig_8);
if(Lot_8<MarketInfo(P_8,MODE_MINLOT)) {Lot_8=MarketInfo(P_8,MODE_MINLOT);} 
if(Lot_8>=MarketInfo(P_8,MODE_MAXLOT)) {Lot_8=MarketInfo(P_8,MODE_MAXLOT);}
//--- 9
if(MarketInfo(P_9,MODE_LOTSTEP)==0.01)     dig_9 =2;
if(MarketInfo(P_9,MODE_LOTSTEP)==0.10)     dig_9 =1;
if(MarketInfo(P_9,MODE_LOTSTEP)==1.00)     dig_9 =0;

Lot_9=NormalizeDouble(AccountBalance()/100*Risk/(MarketInfo(P_9,MODE_TICKVALUE)*100*D_9),dig_9);
if(Lot_9<MarketInfo(P_9,MODE_MINLOT)) {Lot_9=MarketInfo(P_9,MODE_MINLOT);} 
if(Lot_9>=MarketInfo(P_9,MODE_MAXLOT)) {Lot_9=MarketInfo(P_9,MODE_MAXLOT);}
}
//--- Условия для входа
bool GoBuy=false; bool GoSell=false;
if(iOpen(P_1,TimeFrame,1)>iClose(P_1,TimeFrame,1) &&
     iOpen(P_2,TimeFrame,1)>iClose(P_2,TimeFrame,1) &&
       iOpen(P_3,TimeFrame,1)>iClose(P_3,TimeFrame,1) &&
         iOpen(P_4,TimeFrame,1)>iClose(P_4,TimeFrame,1) &&
           iOpen(P_5,TimeFrame,1)<iClose(P_5,TimeFrame,1) &&
             iOpen(P_6,TimeFrame,1)<iClose(P_6,TimeFrame,1) &&
               iOpen(P_7,TimeFrame,1)<iClose(P_7,TimeFrame,1) &&
                 iOpen(P_8,TimeFrame,1)>iClose(P_8,TimeFrame,1) &&
                   iOpen(P_9,TimeFrame,1)>iClose(P_9,TimeFrame,1))
{GoBuy=true;}

if(iOpen(P_1,TimeFrame,1)<iClose(P_1,TimeFrame,1) &&
     iOpen(P_2,TimeFrame,1)<iClose(P_2,TimeFrame,1) &&
       iOpen(P_3,TimeFrame,1)<iClose(P_3,TimeFrame,1) &&
         iOpen(P_4,TimeFrame,1)<iClose(P_4,TimeFrame,1) &&
           iOpen(P_5,TimeFrame,1)>iClose(P_5,TimeFrame,1) &&
             iOpen(P_6,TimeFrame,1)>iClose(P_6,TimeFrame,1) &&
               iOpen(P_7,TimeFrame,1)>iClose(P_7,TimeFrame,1) &&
                 iOpen(P_8,TimeFrame,1)<iClose(P_8,TimeFrame,1) &&
                   iOpen(P_9,TimeFrame,1)<iClose(P_9,TimeFrame,1))
{GoSell=true;}

bool NowBuy_1=false, NowBuy_2=false, NowBuy_3=false, NowBuy_4=false, NowBuy_5=false, NowBuy_6=false, NowBuy_7=false, NowBuy_8=false, NowBuy_9=false;
bool NowSell_1=false, NowSell_2=false, NowSell_3=false, NowSell_4=false, NowSell_5=false, NowSell_6=false, NowSell_7=false, NowSell_8=false, NowSell_9=false; 

SizeBar_1=(iHigh(P_1,TimeFrame,1)-iLow(P_1,TimeFrame,1))/MarketInfo(P_1,MODE_POINT);
SizeBar_2=(iHigh(P_2,TimeFrame,1)-iLow(P_2,TimeFrame,1))/MarketInfo(P_2,MODE_POINT);
SizeBar_3=(iHigh(P_3,TimeFrame,1)-iLow(P_3,TimeFrame,1))/MarketInfo(P_3,MODE_POINT);
SizeBar_4=(iHigh(P_4,TimeFrame,1)-iLow(P_4,TimeFrame,1))/MarketInfo(P_4,MODE_POINT);
SizeBar_5=(iHigh(P_5,TimeFrame,1)-iLow(P_5,TimeFrame,1))/MarketInfo(P_5,MODE_POINT);
SizeBar_6=(iHigh(P_6,TimeFrame,1)-iLow(P_6,TimeFrame,1))/MarketInfo(P_6,MODE_POINT);
SizeBar_7=(iHigh(P_7,TimeFrame,1)-iLow(P_7,TimeFrame,1))/MarketInfo(P_7,MODE_POINT);
SizeBar_8=(iHigh(P_8,TimeFrame,1)-iLow(P_8,TimeFrame,1))/MarketInfo(P_8,MODE_POINT);
SizeBar_9=(iHigh(P_9,TimeFrame,1)-iLow(P_9,TimeFrame,1))/MarketInfo(P_9,MODE_POINT);

if(SizeBar_1>SizeBar_2 &&
     SizeBar_1>SizeBar_3 &&
       SizeBar_1>SizeBar_4 &&
         SizeBar_1>SizeBar_5 &&
           SizeBar_1>SizeBar_6 &&
             SizeBar_1>SizeBar_7 &&
               SizeBar_1>SizeBar_8 &&
                 SizeBar_1>SizeBar_9 && GoBuy)
{NowBuy_1=true;}

if(SizeBar_2>SizeBar_1 &&
     SizeBar_2>SizeBar_3 &&
       SizeBar_2>SizeBar_4 &&
         SizeBar_2>SizeBar_5 &&
           SizeBar_2>SizeBar_6 &&
             SizeBar_2>SizeBar_7 &&
               SizeBar_2>SizeBar_8 &&
                 SizeBar_2>SizeBar_9 && GoBuy)
{NowBuy_2=true;}

if(SizeBar_3>SizeBar_2 &&
     SizeBar_3>SizeBar_1 &&
       SizeBar_3>SizeBar_4 &&
         SizeBar_3>SizeBar_5 &&
           SizeBar_3>SizeBar_6 &&
             SizeBar_3>SizeBar_7 &&
               SizeBar_3>SizeBar_8 &&
                 SizeBar_3>SizeBar_9 && GoBuy)
{NowBuy_3=true;}

if(SizeBar_4>SizeBar_2 &&
     SizeBar_4>SizeBar_3 &&
       SizeBar_4>SizeBar_1 &&
         SizeBar_4>SizeBar_5 &&
           SizeBar_4>SizeBar_6 &&
             SizeBar_4>SizeBar_7 &&
               SizeBar_4>SizeBar_8 &&
                 SizeBar_4>SizeBar_9 && GoBuy)
{NowBuy_4=true;}

if(SizeBar_5>SizeBar_2 &&
     SizeBar_5>SizeBar_3 &&
       SizeBar_5>SizeBar_4 &&
         SizeBar_5>SizeBar_1 &&
           SizeBar_5>SizeBar_6 &&
             SizeBar_5>SizeBar_7 &&
               SizeBar_5>SizeBar_8 &&
                 SizeBar_5>SizeBar_9 && GoBuy)
{NowSell_5=true;}

if(SizeBar_6>SizeBar_2 &&
     SizeBar_6>SizeBar_3 &&
       SizeBar_6>SizeBar_4 &&
         SizeBar_6>SizeBar_5 &&
           SizeBar_6>SizeBar_1 &&
             SizeBar_6>SizeBar_7 &&
               SizeBar_6>SizeBar_8 &&
                 SizeBar_6>SizeBar_9 && GoBuy)
{NowSell_6=true;}

if(SizeBar_7>SizeBar_2 &&
     SizeBar_7>SizeBar_3 &&
       SizeBar_7>SizeBar_4 &&
         SizeBar_7>SizeBar_5 &&
           SizeBar_7>SizeBar_6 &&
             SizeBar_7>SizeBar_1 &&
               SizeBar_7>SizeBar_8 &&
                 SizeBar_7>SizeBar_9 && GoBuy)
{NowSell_7=true;}

if(SizeBar_8>SizeBar_2 &&
     SizeBar_8>SizeBar_3 &&
       SizeBar_8>SizeBar_4 &&
         SizeBar_8>SizeBar_5 &&
           SizeBar_8>SizeBar_6 &&
             SizeBar_8>SizeBar_7 &&
               SizeBar_8>SizeBar_1 &&
                 SizeBar_8>SizeBar_9 && GoBuy)
{NowBuy_8=true;}

if(SizeBar_9>SizeBar_2 &&
     SizeBar_9>SizeBar_3 &&
       SizeBar_9>SizeBar_4 &&
         SizeBar_9>SizeBar_5 &&
           SizeBar_9>SizeBar_6 &&
             SizeBar_9>SizeBar_7 &&
               SizeBar_9>SizeBar_8 &&
                 SizeBar_9>SizeBar_1 && GoBuy)
{NowBuy_9=true;}

//В обратную сторону

if(SizeBar_1>SizeBar_2 &&
     SizeBar_1>SizeBar_3 &&
       SizeBar_1>SizeBar_4 &&
         SizeBar_1>SizeBar_5 &&
           SizeBar_1>SizeBar_6 &&
             SizeBar_1>SizeBar_7 &&
               SizeBar_1>SizeBar_8 &&
                 SizeBar_1>SizeBar_9 && GoSell)
{NowSell_1=true;}

if(SizeBar_2>SizeBar_1 &&
     SizeBar_2>SizeBar_3 &&
       SizeBar_2>SizeBar_4 &&
         SizeBar_2>SizeBar_5 &&
           SizeBar_2>SizeBar_6 &&
             SizeBar_2>SizeBar_7 &&
               SizeBar_2>SizeBar_8 &&
                 SizeBar_2>SizeBar_9 && GoSell)
{NowSell_2=true;}

if(SizeBar_3>SizeBar_2 &&
     SizeBar_3>SizeBar_1 &&
       SizeBar_3>SizeBar_4 &&
         SizeBar_3>SizeBar_5 &&
           SizeBar_3>SizeBar_6 &&
             SizeBar_3>SizeBar_7 &&
               SizeBar_3>SizeBar_8 &&
                 SizeBar_3>SizeBar_9 && GoSell)
{NowSell_3=true;}

if(SizeBar_4>SizeBar_2 &&
     SizeBar_4>SizeBar_3 &&
       SizeBar_4>SizeBar_1 &&
         SizeBar_4>SizeBar_5 &&
           SizeBar_4>SizeBar_6 &&
             SizeBar_4>SizeBar_7 &&
               SizeBar_4>SizeBar_8 &&
                 SizeBar_4>SizeBar_9 && GoSell)
{NowSell_4=true;}

if(SizeBar_5>SizeBar_2 &&
     SizeBar_5>SizeBar_3 &&
       SizeBar_5>SizeBar_4 &&
         SizeBar_5>SizeBar_1 &&
           SizeBar_5>SizeBar_6 &&
             SizeBar_5>SizeBar_7 &&
               SizeBar_5>SizeBar_8 &&
                 SizeBar_5>SizeBar_9 && GoSell)
{NowBuy_5=true;}

if(SizeBar_6>SizeBar_2 &&
     SizeBar_6>SizeBar_3 &&
       SizeBar_6>SizeBar_4 &&
         SizeBar_6>SizeBar_5 &&
           SizeBar_6>SizeBar_1 &&
             SizeBar_6>SizeBar_7 &&
               SizeBar_6>SizeBar_8 &&
                 SizeBar_6>SizeBar_9 && GoSell)
{NowBuy_6=true;}

if(SizeBar_7>SizeBar_2 &&
     SizeBar_7>SizeBar_3 &&
       SizeBar_7>SizeBar_4 &&
         SizeBar_7>SizeBar_5 &&
           SizeBar_7>SizeBar_6 &&
             SizeBar_7>SizeBar_1 &&
               SizeBar_7>SizeBar_8 &&
                 SizeBar_7>SizeBar_9 && GoSell)
{NowBuy_7=true;}

if(SizeBar_8>SizeBar_2 &&
     SizeBar_8>SizeBar_3 &&
       SizeBar_8>SizeBar_4 &&
         SizeBar_8>SizeBar_5 &&
           SizeBar_8>SizeBar_6 &&
             SizeBar_8>SizeBar_7 &&
               SizeBar_8>SizeBar_1 &&
                 SizeBar_8>SizeBar_9 && GoSell)
{NowSell_8=true;}

if(SizeBar_9>SizeBar_2 &&
     SizeBar_9>SizeBar_3 &&
       SizeBar_9>SizeBar_4 &&
         SizeBar_9>SizeBar_5 &&
           SizeBar_9>SizeBar_6 &&
             SizeBar_9>SizeBar_7 &&
               SizeBar_9>SizeBar_8 &&
                 SizeBar_9>SizeBar_1 && GoSell)
{NowSell_9=true;}

//-----------------------
if(UseUPlot)
{
Lot_1=NormalizeDouble(Lot_1+LastLot(-1,P_1), dig_1);
Lot_2=NormalizeDouble(Lot_2+LastLot(-1,P_2), dig_2);
Lot_3=NormalizeDouble(Lot_3+LastLot(-1,P_3), dig_3);
Lot_4=NormalizeDouble(Lot_4+LastLot(-1,P_4), dig_4);
Lot_5=NormalizeDouble(Lot_5+LastLot(-1,P_5), dig_5);
Lot_6=NormalizeDouble(Lot_6+LastLot(-1,P_6), dig_6);
Lot_7=NormalizeDouble(Lot_7+LastLot(-1,P_7), dig_7);
Lot_8=NormalizeDouble(Lot_8+LastLot(-1,P_8), dig_8);
Lot_9=NormalizeDouble(Lot_9+LastLot(-1,P_9), dig_9);
}
else
{
Lot_1=Lot_1;
Lot_2=Lot_2;
Lot_3=Lot_3;
Lot_4=Lot_4;
Lot_5=Lot_5;
Lot_6=Lot_6;
Lot_7=Lot_7;
Lot_8=Lot_8;
Lot_9=Lot_9;
}

if(!ObjectGetInteger(0,"TRADEs_AU",OBJPROP_STATE) && TimeHour(TimeCurrent())>=TimeStart && TimeHour(TimeCurrent())<TimeEnd)
{

//--- 

if(CountBar(-1,P_1)==0 && CountBarHist(-1,P_1)==0 &&
CountPair(-1,P_1,Magic)==0 && AccountFreeMarginCheck(P_1,OP_BUY,Lot_1)>0 && NowBuy_1)
{o=OrderSend(P_1,OP_BUY,Lot_1,MarketInfo(P_1,MODE_ASK),10,0,0,comment,Magic,0,Green);}

if(CountBar(-1,P_2)==0 && CountBarHist(-1,P_2)==0 &&
CountPair(-1,P_2,Magic)==0 && AccountFreeMarginCheck(P_2,OP_BUY,Lot_2)>0 && NowBuy_2)
{o=OrderSend(P_2,OP_BUY,Lot_2,MarketInfo(P_2,MODE_ASK),10,0,0,comment,Magic,0,Green);}

if(CountBar(-1,P_3)==0 && CountBarHist(-1,P_3)==0 &&
CountPair(-1,P_3,Magic)==0 && AccountFreeMarginCheck(P_3,OP_BUY,Lot_3)>0 && NowBuy_3)
{o=OrderSend(P_3,OP_BUY,Lot_3,MarketInfo(P_3,MODE_ASK),10,0,0,comment,Magic,0,Green);}

if(CountBar(-1,P_4)==0 && CountBarHist(-1,P_4)==0 &&
CountPair(-1,P_4,Magic)==0 && AccountFreeMarginCheck(P_4,OP_BUY,Lot_4)>0 && NowBuy_4)
{o=OrderSend(P_4,OP_BUY,Lot_4,MarketInfo(P_4,MODE_ASK),10,0,0,comment,Magic,0,Green);}

if(CountBar(-1,P_5)==0 && CountBarHist(-1,P_5)==0 &&
CountPair(-1,P_5,Magic)==0 && AccountFreeMarginCheck(P_5,OP_BUY,Lot_5)>0 && NowBuy_5)
{o=OrderSend(P_5,OP_BUY,Lot_5,MarketInfo(P_5,MODE_ASK),10,0,0,comment,Magic,0,Green);}

if(CountBar(-1,P_6)==0 && CountBarHist(-1,P_6)==0 &&
CountPair(-1,P_6,Magic)==0 && AccountFreeMarginCheck(P_6,OP_BUY,Lot_6)>0 && NowBuy_6)
{o=OrderSend(P_6,OP_BUY,Lot_6,MarketInfo(P_6,MODE_ASK),10,0,0,comment,Magic,0,Green);}

if(CountBar(-1,P_7)==0 && CountBarHist(-1,P_7)==0 &&
CountPair(-1,P_7,Magic)==0 && AccountFreeMarginCheck(P_7,OP_BUY,Lot_7)>0 && NowBuy_7)
{o=OrderSend(P_7,OP_BUY,Lot_7,MarketInfo(P_7,MODE_ASK),10,0,0,comment,Magic,0,Green);}

if(CountBar(-1,P_8)==0 && CountBarHist(-1,P_8)==0 &&
CountPair(-1,P_8,Magic)==0 && AccountFreeMarginCheck(P_8,OP_BUY,Lot_8)>0 && NowBuy_8)
{o=OrderSend(P_8,OP_BUY,Lot_8,MarketInfo(P_8,MODE_ASK),10,0,0,comment,Magic,0,Green);}

if(CountBar(-1,P_9)==0 && CountBarHist(-1,P_9)==0 &&
CountPair(-1,P_9,Magic)==0 && AccountFreeMarginCheck(P_9,OP_BUY,Lot_9)>0 && NowBuy_9)
{o=OrderSend(P_9,OP_BUY,Lot_9,MarketInfo(P_9,MODE_ASK),10,0,0,comment,Magic,0,Green);}


//---

if(CountBar(-1,P_1)==0 && CountBarHist(-1,P_1)==0 &&
CountPair(-1,P_1,Magic)==0 && AccountFreeMarginCheck(P_1,OP_SELL,Lot_1)>0 && NowSell_1)
{o=OrderSend(P_1,OP_SELL,Lot_1,MarketInfo(P_1,MODE_BID),10,0,0,comment,Magic,0,Red);}

if(CountBar(-1,P_2)==0 && CountBarHist(-1,P_2)==0 &&
CountPair(-1,P_2,Magic)==0 && AccountFreeMarginCheck(P_2,OP_SELL,Lot_2)>0 && NowSell_2)
{o=OrderSend(P_2,OP_SELL,Lot_2,MarketInfo(P_2,MODE_BID),10,0,0,comment,Magic,0,Red);}

if(CountBar(-1,P_3)==0 && CountBarHist(-1,P_3)==0 &&
CountPair(-1,P_3,Magic)==0 && AccountFreeMarginCheck(P_3,OP_SELL,Lot_3)>0 && NowSell_3)
{o=OrderSend(P_3,OP_SELL,Lot_3,MarketInfo(P_3,MODE_BID),10,0,0,comment,Magic,0,Red);}

if(CountBar(-1,P_4)==0 && CountBarHist(-1,P_4)==0 &&
CountPair(-1,P_4,Magic)==0 && AccountFreeMarginCheck(P_4,OP_SELL,Lot_4)>0 && NowSell_4)
{o=OrderSend(P_4,OP_SELL,Lot_4,MarketInfo(P_4,MODE_BID),10,0,0,comment,Magic,0,Red);}

if(CountBar(-1,P_5)==0 && CountBarHist(-1,P_5)==0 &&
CountPair(-1,P_5,Magic)==0 && AccountFreeMarginCheck(P_5,OP_SELL,Lot_5)>0 && NowSell_5)
{o=OrderSend(P_5,OP_SELL,Lot_5,MarketInfo(P_5,MODE_BID),10,0,0,comment,Magic,0,Red);}

if(CountBar(-1,P_6)==0 && CountBarHist(-1,P_6)==0 &&
CountPair(-1,P_6,Magic)==0 && AccountFreeMarginCheck(P_6,OP_SELL,Lot_6)>0 && NowSell_6)
{o=OrderSend(P_6,OP_SELL,Lot_6,MarketInfo(P_6,MODE_BID),10,0,0,comment,Magic,0,Red);}

if(CountBar(-1,P_7)==0 && CountBarHist(-1,P_7)==0 &&
CountPair(-1,P_7,Magic)==0 && AccountFreeMarginCheck(P_7,OP_SELL,Lot_7)>0 && NowSell_7)
{o=OrderSend(P_7,OP_SELL,Lot_7,MarketInfo(P_7,MODE_BID),10,0,0,comment,Magic,0,Red);}

if(CountBar(-1,P_8)==0 && CountBarHist(-1,P_8)==0 &&
CountPair(-1,P_8,Magic)==0 && AccountFreeMarginCheck(P_8,OP_SELL,Lot_8)>0 && NowSell_8)
{o=OrderSend(P_8,OP_SELL,Lot_8,MarketInfo(P_8,MODE_BID),10,0,0,comment,Magic,0,Red);}

if(CountBar(-1,P_9)==0 && CountBarHist(-1,P_9)==0 &&
CountPair(-1,P_9,Magic)==0 && AccountFreeMarginCheck(P_9,OP_SELL,Lot_9)>0 && NowSell_9)
{o=OrderSend(P_9,OP_SELL,Lot_9,MarketInfo(P_9,MODE_BID),10,0,0,comment,Magic,0,Red);}

//---
}

if(CountAll(-1)<MaxOrders && TimeHour(TimeCurrent())>=TimeStart && TimeHour(TimeCurrent())<TimeEnd
    && (CountAll(-1)<AccountInfoInteger(ACCOUNT_LIMIT_ORDERS) || AccountInfoInteger(ACCOUNT_LIMIT_ORDERS)==0))
{
if(!ObjectGetInteger(0,"TRADEs_SM",OBJPROP_STATE))
{
if(CountBar(-1,P_1)==0 && CountBarHist(-1,P_1)==0 && CountPair(OP_BUY,pEURUSD,Magic)>0 && AccountFreeMarginCheck(pEURUSD,OP_BUY,Lot_1)>0 && NowBuy_1)
{if(CountPairPlus(OP_BUY,pEURUSD,Magic)==0)
{if(MarketInfo(pEURUSD,MODE_ASK)+pEURUSD_StepM*MarketInfo(pEURUSD,MODE_POINT)<=OldPricB(pEURUSD,Magic))
{o=OrderSend(pEURUSD,OP_BUY,Lot_1,MarketInfo(pEURUSD,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
}
if(CountBar(-1,P_1)==0 && CountBarHist(-1,P_1)==0 && CountPair(OP_SELL,pEURUSD,Magic)>0 && AccountFreeMarginCheck(pEURUSD,OP_SELL,Lot_1)>0 && NowSell_1)
{if(CountPairPlus(OP_SELL,pEURUSD,Magic)==0)
{if(MarketInfo(pEURUSD,MODE_BID)-pEURUSD_StepM*MarketInfo(pEURUSD,MODE_POINT)>=OldPricS(pEURUSD,Magic))
{o=OrderSend(pEURUSD,OP_SELL,Lot_1,MarketInfo(pEURUSD,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
}
//-----------
if(CountBar(-1,P_2)==0 && CountBarHist(-1,P_2)==0 && CountPair(OP_BUY,pGBPUSD,Magic)>0 && AccountFreeMarginCheck(pGBPUSD,OP_BUY,Lot_2)>0 && NowBuy_2)
{if(CountPairPlus(OP_BUY,pGBPUSD,Magic)==0)
{if(MarketInfo(pGBPUSD,MODE_ASK)+pGBPUSD_StepM*MarketInfo(pGBPUSD,MODE_POINT)<=OldPricB(pGBPUSD,Magic))
{o=OrderSend(pGBPUSD,OP_BUY,Lot_2,MarketInfo(pGBPUSD,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
}
if(CountBar(-1,P_2)==0 && CountBarHist(-1,P_2)==0 && CountPair(OP_SELL,pGBPUSD,Magic)>0 && AccountFreeMarginCheck(pGBPUSD,OP_SELL,Lot_2)>0 && NowSell_2)
{if(CountPairPlus(OP_SELL,pGBPUSD,Magic)==0)
{if(MarketInfo(pGBPUSD,MODE_BID)-pGBPUSD_StepM*MarketInfo(pGBPUSD,MODE_POINT)>=OldPricS(pGBPUSD,Magic))
{o=OrderSend(pGBPUSD,OP_SELL,Lot_2,MarketInfo(pGBPUSD,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
}
//-----------
if(CountBar(-1,P_3)==0 && CountBarHist(-1,P_3)==0 && CountPair(OP_BUY,pAUDUSD,Magic)>0 && AccountFreeMarginCheck(pAUDUSD,OP_BUY,Lot_3)>0 && NowBuy_3)
{if(CountPairPlus(OP_BUY,pAUDUSD,Magic)==0)
{if(MarketInfo(pAUDUSD,MODE_ASK)+pAUDUSD_StepM*MarketInfo(pAUDUSD,MODE_POINT)<=OldPricB(pAUDUSD,Magic))
{o=OrderSend(pAUDUSD,OP_BUY,Lot_3,MarketInfo(pAUDUSD,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
}
if(CountBar(-1,P_3)==0 && CountBarHist(-1,P_3)==0 && CountPair(OP_SELL,pAUDUSD,Magic)>0 && AccountFreeMarginCheck(pAUDUSD,OP_SELL,Lot_3)>0 && NowSell_3)
{if(CountPairPlus(OP_SELL,pAUDUSD,Magic)==0)
{if(MarketInfo(pAUDUSD,MODE_BID)-pAUDUSD_StepM*MarketInfo(pAUDUSD,MODE_POINT)>=OldPricS(pAUDUSD,Magic))
{o=OrderSend(pAUDUSD,OP_SELL,Lot_3,MarketInfo(pAUDUSD,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
}
//-----------
if(CountBar(-1,P_4)==0 && CountBarHist(-1,P_4)==0 && CountPair(OP_BUY,pNZDUSD,Magic)>0 && AccountFreeMarginCheck(pNZDUSD,OP_BUY,Lot_4)>0 && NowBuy_4)
{if(CountPairPlus(OP_BUY,pNZDUSD,Magic)==0)
{if(MarketInfo(pNZDUSD,MODE_ASK)+pNZDUSD_StepM*MarketInfo(pNZDUSD,MODE_POINT)<=OldPricB(pNZDUSD,Magic))
{o=OrderSend(pNZDUSD,OP_BUY,Lot_4,MarketInfo(pNZDUSD,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
}
if(CountBar(-1,P_4)==0 && CountBarHist(-1,P_4)==0 && CountPair(OP_SELL,pNZDUSD,Magic)>0 && AccountFreeMarginCheck(pNZDUSD,OP_SELL,Lot_4)>0 && NowSell_4)
{if(CountPairPlus(OP_SELL,pNZDUSD,Magic)==0)
{if(MarketInfo(pNZDUSD,MODE_BID)-pNZDUSD_StepM*MarketInfo(pNZDUSD,MODE_POINT)>=OldPricS(pNZDUSD,Magic))
{o=OrderSend(pNZDUSD,OP_SELL,Lot_4,MarketInfo(pNZDUSD,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
}
//-----------
if(CountBar(-1,P_5)==0 && CountBarHist(-1,P_5)==0 && CountPair(OP_BUY,pUSDJPY,Magic)>0 && AccountFreeMarginCheck(pUSDJPY,OP_BUY,Lot_5)>0 && NowBuy_5)
{if(CountPairPlus(OP_BUY,pUSDJPY,Magic)==0)
{if(MarketInfo(pUSDJPY,MODE_ASK)+pUSDJPY_StepM*MarketInfo(pUSDJPY,MODE_POINT)<=OldPricB(pUSDJPY,Magic))
{o=OrderSend(pUSDJPY,OP_BUY,Lot_5,MarketInfo(pUSDJPY,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
}
if(CountBar(-1,P_5)==0 && CountBarHist(-1,P_5)==0 && CountPair(OP_SELL,pUSDJPY,Magic)>0 && AccountFreeMarginCheck(pUSDJPY,OP_SELL,Lot_5)>0 && NowSell_5)
{if(CountPairPlus(OP_SELL,pUSDJPY,Magic)==0)
{if(MarketInfo(pUSDJPY,MODE_BID)-pUSDJPY_StepM*MarketInfo(pUSDJPY,MODE_POINT)>=OldPricS(pUSDJPY,Magic))
{o=OrderSend(pUSDJPY,OP_SELL,Lot_5,MarketInfo(pUSDJPY,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
}
//-----------
if(CountBar(-1,P_6)==0 && CountBarHist(-1,P_6)==0 && CountPair(OP_BUY,pUSDCAD,Magic)>0 && AccountFreeMarginCheck(pUSDCAD,OP_BUY,Lot_6)>0 && NowBuy_6)
{if(CountPairPlus(OP_BUY,pUSDCAD,Magic)==0)
{if(MarketInfo(pUSDCAD,MODE_ASK)+pUSDCAD_StepM*MarketInfo(pUSDCAD,MODE_POINT)<=OldPricB(pUSDCAD,Magic))
{o=OrderSend(pUSDCAD,OP_BUY,Lot_6,MarketInfo(pUSDCAD,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
}
if(CountBar(-1,P_6)==0 && CountBarHist(-1,P_6)==0 && CountPair(OP_SELL,pUSDCAD,Magic)>0 && AccountFreeMarginCheck(pUSDCAD,OP_SELL,Lot_6)>0 && NowSell_6)
{if(CountPairPlus(OP_SELL,pUSDCAD,Magic)==0)
{if(MarketInfo(pUSDCAD,MODE_BID)-pUSDCAD_StepM*MarketInfo(pUSDCAD,MODE_POINT)>=OldPricS(pUSDCAD,Magic))
{o=OrderSend(pUSDCAD,OP_SELL,Lot_6,MarketInfo(pUSDCAD,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
}
//-----------
if(CountBar(-1,P_7)==0 && CountBarHist(-1,P_7)==0 && CountPair(OP_BUY,pUSDCHF,Magic)>0 && AccountFreeMarginCheck(pUSDCHF,OP_BUY,Lot_7)>0 && NowBuy_7)
{if(CountPairPlus(OP_BUY,pUSDCHF,Magic)==0)
{if(MarketInfo(pUSDCHF,MODE_ASK)+pUSDCHF_StepM*MarketInfo(pUSDCHF,MODE_POINT)<=OldPricB(pUSDCHF,Magic))
{o=OrderSend(pUSDCHF,OP_BUY,Lot_7,MarketInfo(pUSDCHF,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
}
if(CountBar(-1,P_7)==0 && CountBarHist(-1,P_7)==0 && CountPair(OP_SELL,pUSDCHF,Magic)>0 && AccountFreeMarginCheck(pUSDCHF,OP_SELL,Lot_7)>0 && NowSell_7)
{if(CountPairPlus(OP_SELL,pUSDCHF,Magic)==0)
{if(MarketInfo(pUSDCHF,MODE_BID)-pUSDCHF_StepM*MarketInfo(pUSDCHF,MODE_POINT)>=OldPricS(pUSDCHF,Magic))
{o=OrderSend(pUSDCHF,OP_SELL,Lot_7,MarketInfo(pUSDCHF,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
}
//-----------
if(CountBar(-1,P_8)==0 && CountBarHist(-1,P_8)==0 && CountPair(OP_BUY,pEURJPY,Magic)>0 && AccountFreeMarginCheck(pEURJPY,OP_BUY,Lot_8)>0 && NowBuy_8)
{if(CountPairPlus(OP_BUY,pEURJPY,Magic)==0)
{if(MarketInfo(pEURJPY,MODE_ASK)+pEURJPY_StepM*MarketInfo(pEURJPY,MODE_POINT)<=OldPricB(pEURJPY,Magic))
{o=OrderSend(pEURJPY,OP_BUY,Lot_8,MarketInfo(pEURJPY,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
}
if(CountBar(-1,P_8)==0 && CountBarHist(-1,P_8)==0 && CountPair(OP_SELL,pEURJPY,Magic)>0 && AccountFreeMarginCheck(pEURJPY,OP_SELL,Lot_8)>0 && NowSell_8)
{if(CountPairPlus(OP_SELL,pEURJPY,Magic)==0)
{if(MarketInfo(pEURJPY,MODE_BID)-pEURJPY_StepM*MarketInfo(pEURJPY,MODE_POINT)>=OldPricS(pEURJPY,Magic))
{o=OrderSend(pEURJPY,OP_SELL,Lot_8,MarketInfo(pEURJPY,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
}
//-----------
if(CountBar(-1,P_9)==0 && CountBarHist(-1,P_9)==0 && CountPair(OP_BUY,pGBPJPY,Magic)>0 && AccountFreeMarginCheck(pGBPJPY,OP_BUY,Lot_9)>0 && NowBuy_9)
{if(CountPairPlus(OP_BUY,pGBPJPY,Magic)==0)
{if(MarketInfo(pGBPJPY,MODE_ASK)+pGBPJPY_StepM*MarketInfo(pGBPJPY,MODE_POINT)<=OldPricB(pGBPJPY,Magic))
{o=OrderSend(pGBPJPY,OP_BUY,Lot_9,MarketInfo(pGBPJPY,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
}
if(CountBar(-1,P_9)==0 && CountBarHist(-1,P_9)==0 && CountPair(OP_SELL,pGBPJPY,Magic)>0 && AccountFreeMarginCheck(pGBPJPY,OP_SELL,Lot_9)>0 && NowSell_9)
{if(CountPairPlus(OP_SELL,pGBPJPY,Magic)==0)
{if(MarketInfo(pGBPJPY,MODE_BID)-pGBPJPY_StepM*MarketInfo(pGBPJPY,MODE_POINT)>=OldPricS(pGBPJPY,Magic))
{o=OrderSend(pGBPJPY,OP_SELL,Lot_9,MarketInfo(pGBPJPY,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
}
//-----------
}
if(!ObjectGetInteger(0,"TRADEs_SP",OBJPROP_STATE))
{
if(CountBar(-1,P_1)==0 && CountBarHist(-1,P_1)==0 && CountPair(OP_BUY,pEURUSD,Magic)>0 && AccountFreeMarginCheck(pEURUSD,OP_BUY,Lot_1)>0 && NowBuy_1)
{if(MarketInfo(pEURUSD,MODE_ASK)-pEURUSD_StepP*MarketInfo(pEURUSD,MODE_POINT)>=OldPricB(pEURUSD,Magic) && Profit(-1,pEURUSD)>0)
{o=OrderSend(pEURUSD,OP_BUY,Lot_1,MarketInfo(pEURUSD,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
if(CountBar(-1,P_1)==0 && CountBarHist(-1,P_1)==0 && CountPair(OP_SELL,pEURUSD,Magic)>0 && AccountFreeMarginCheck(pEURUSD,OP_SELL,Lot_1)>0 && NowSell_1)
{if(MarketInfo(pEURUSD,MODE_BID)+pEURUSD_StepP*MarketInfo(pEURUSD,MODE_POINT)<=OldPricS(pEURUSD,Magic) && Profit(-1,pEURUSD)>0)
{o=OrderSend(pEURUSD,OP_SELL,Lot_1,MarketInfo(pEURUSD,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
//-----------
if(CountBar(-1,P_2)==0 && CountBarHist(-1,P_2)==0 && CountPair(OP_BUY,pGBPUSD,Magic)>0 && AccountFreeMarginCheck(pGBPUSD,OP_BUY,Lot_2)>0 && NowBuy_2)
{if(MarketInfo(pGBPUSD,MODE_ASK)-pGBPUSD_StepP*MarketInfo(pGBPUSD,MODE_POINT)>=OldPricB(pGBPUSD,Magic) && Profit(-1,pGBPUSD)>0)
{o=OrderSend(pGBPUSD,OP_BUY,Lot_2,MarketInfo(pGBPUSD,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
if(CountBar(-1,P_2)==0 && CountBarHist(-1,P_2)==0 && CountPair(OP_SELL,pGBPUSD,Magic)>0 && AccountFreeMarginCheck(pGBPUSD,OP_SELL,Lot_2)>0 && NowSell_2)
{if(MarketInfo(pGBPUSD,MODE_BID)+pGBPUSD_StepP*MarketInfo(pGBPUSD,MODE_POINT)<=OldPricS(pGBPUSD,Magic) && Profit(-1,pGBPUSD)>0)
{o=OrderSend(pGBPUSD,OP_SELL,Lot_2,MarketInfo(pGBPUSD,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
//-----------
if(CountBar(-1,P_3)==0 && CountBarHist(-1,P_3)==0 && CountPair(OP_BUY,pAUDUSD,Magic)>0 && AccountFreeMarginCheck(pAUDUSD,OP_BUY,Lot_3)>0 && NowBuy_3)
{if(MarketInfo(pAUDUSD,MODE_ASK)-pAUDUSD_StepP*MarketInfo(pAUDUSD,MODE_POINT)>=OldPricB(pAUDUSD,Magic) && Profit(-1,pAUDUSD)>0)
{o=OrderSend(pAUDUSD,OP_BUY,Lot_3,MarketInfo(pAUDUSD,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
if(CountBar(-1,P_3)==0 && CountBarHist(-1,P_3)==0 && CountPair(OP_SELL,pAUDUSD,Magic)>0 && AccountFreeMarginCheck(pAUDUSD,OP_SELL,Lot_3)>0 && NowSell_3)
{if(MarketInfo(pAUDUSD,MODE_BID)+pAUDUSD_StepP*MarketInfo(pAUDUSD,MODE_POINT)<=OldPricS(pAUDUSD,Magic) && Profit(-1,pAUDUSD)>0)
{o=OrderSend(pAUDUSD,OP_SELL,Lot_3,MarketInfo(pAUDUSD,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
//-----------
if(CountBar(-1,P_4)==0 && CountBarHist(-1,P_4)==0 && CountPair(OP_BUY,pNZDUSD,Magic)>0 && AccountFreeMarginCheck(pNZDUSD,OP_BUY,Lot_4)>0 && NowBuy_4)
{if(MarketInfo(pNZDUSD,MODE_ASK)-pNZDUSD_StepP*MarketInfo(pNZDUSD,MODE_POINT)>=OldPricB(pNZDUSD,Magic) && Profit(-1,pNZDUSD)>0)
{o=OrderSend(pNZDUSD,OP_BUY,Lot_4,MarketInfo(pNZDUSD,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
if(CountBar(-1,P_4)==0 && CountBarHist(-1,P_4)==0 && CountPair(OP_SELL,pNZDUSD,Magic)>0 && AccountFreeMarginCheck(pNZDUSD,OP_SELL,Lot_4)>0 && NowSell_4)
{if(MarketInfo(pNZDUSD,MODE_BID)+pNZDUSD_StepP*MarketInfo(pNZDUSD,MODE_POINT)<=OldPricS(pNZDUSD,Magic) && Profit(-1,pNZDUSD)>0)
{o=OrderSend(pNZDUSD,OP_SELL,Lot_4,MarketInfo(pNZDUSD,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
//-----------
if(CountBar(-1,P_5)==0 && CountBarHist(-1,P_5)==0 && CountPair(OP_BUY,pUSDJPY,Magic)>0 && AccountFreeMarginCheck(pUSDJPY,OP_BUY,Lot_5)>0 && NowBuy_5)
{if(MarketInfo(pUSDJPY,MODE_ASK)-pUSDJPY_StepP*MarketInfo(pUSDJPY,MODE_POINT)>=OldPricB(pUSDJPY,Magic) && Profit(-1,pUSDJPY)>0)
{o=OrderSend(pUSDJPY,OP_BUY,Lot_5,MarketInfo(pUSDJPY,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
if(CountBar(-1,P_5)==0 && CountBarHist(-1,P_5)==0 && CountPair(OP_SELL,pUSDJPY,Magic)>0 && AccountFreeMarginCheck(pUSDJPY,OP_SELL,Lot_5)>0 && NowSell_5)
{if(MarketInfo(pUSDJPY,MODE_BID)+pUSDJPY_StepP*MarketInfo(pUSDJPY,MODE_POINT)<=OldPricS(pUSDJPY,Magic) && Profit(-1,pUSDJPY)>0)
{o=OrderSend(pUSDJPY,OP_SELL,Lot_5,MarketInfo(pUSDJPY,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
//-----------
if(CountBar(-1,P_6)==0 && CountBarHist(-1,P_6)==0 && CountPair(OP_BUY,pUSDCAD,Magic)>0 && AccountFreeMarginCheck(pUSDCAD,OP_BUY,Lot_6)>0 && NowBuy_6)
{if(MarketInfo(pUSDCAD,MODE_ASK)-pUSDCAD_StepP*MarketInfo(pUSDCAD,MODE_POINT)>=OldPricB(pUSDCAD,Magic) && Profit(-1,pUSDCAD)>0)
{o=OrderSend(pUSDCAD,OP_BUY,Lot_6,MarketInfo(pUSDCAD,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
if(CountBar(-1,P_6)==0 && CountBarHist(-1,P_6)==0 && CountPair(OP_SELL,pUSDCAD,Magic)>0 && AccountFreeMarginCheck(pUSDCAD,OP_SELL,Lot_6)>0 && NowSell_6)
{if(MarketInfo(pUSDCAD,MODE_BID)+pUSDCAD_StepP*MarketInfo(pUSDCAD,MODE_POINT)<=OldPricS(pUSDCAD,Magic) && Profit(-1,pUSDCAD)>0)
{o=OrderSend(pUSDCAD,OP_SELL,Lot_6,MarketInfo(pUSDCAD,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
//-----------
if(CountBar(-1,P_7)==0 && CountBarHist(-1,P_7)==0 && CountPair(OP_BUY,pUSDCHF,Magic)>0 && AccountFreeMarginCheck(pUSDCHF,OP_BUY,Lot_7)>0 && NowBuy_7)
{if(MarketInfo(pUSDCHF,MODE_ASK)-pUSDCHF_StepP*MarketInfo(pUSDCHF,MODE_POINT)>=OldPricB(pUSDCHF,Magic) && Profit(-1,pUSDCHF)>0)
{o=OrderSend(pUSDCHF,OP_BUY,Lot_7,MarketInfo(pUSDCHF,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
if(CountBar(-1,P_7)==0 && CountBarHist(-1,P_7)==0 && CountPair(OP_SELL,pUSDCHF,Magic)>0 && AccountFreeMarginCheck(pUSDCHF,OP_SELL,Lot_7)>0 && NowSell_7)
{if(MarketInfo(pUSDCHF,MODE_BID)+pUSDCHF_StepP*MarketInfo(pUSDCHF,MODE_POINT)<=OldPricS(pUSDCHF,Magic) && Profit(-1,pUSDCHF)>0)
{o=OrderSend(pUSDCHF,OP_SELL,Lot_7,MarketInfo(pUSDCHF,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
//-----------
if(CountBar(-1,P_8)==0 && CountBarHist(-1,P_8)==0 && CountPair(OP_BUY,pEURJPY,Magic)>0 && AccountFreeMarginCheck(pEURJPY,OP_BUY,Lot_8)>0 && NowBuy_8)
{if(MarketInfo(pEURJPY,MODE_ASK)-pEURJPY_StepP*MarketInfo(pEURJPY,MODE_POINT)>=OldPricB(pEURJPY,Magic) && Profit(-1,pEURJPY)>0)
{o=OrderSend(pEURJPY,OP_BUY,Lot_8,MarketInfo(pEURJPY,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
if(CountBar(-1,P_8)==0 && CountBarHist(-1,P_8)==0 && CountPair(OP_SELL,pEURJPY,Magic)>0 && AccountFreeMarginCheck(pEURJPY,OP_SELL,Lot_8)>0 && NowSell_8)
{if(MarketInfo(pEURJPY,MODE_BID)+pEURJPY_StepP*MarketInfo(pEURJPY,MODE_POINT)<=OldPricS(pEURJPY,Magic) && Profit(-1,pEURJPY)>0)
{o=OrderSend(pEURJPY,OP_SELL,Lot_8,MarketInfo(pEURJPY,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
//-----------
if(CountBar(-1,P_9)==0 && CountBarHist(-1,P_9)==0 && CountPair(OP_BUY,pGBPJPY,Magic)>0 && AccountFreeMarginCheck(pGBPJPY,OP_BUY,Lot_9)>0 && NowBuy_9)
{if(MarketInfo(pGBPJPY,MODE_ASK)-pGBPJPY_StepP*MarketInfo(pGBPJPY,MODE_POINT)>=OldPricB(pGBPJPY,Magic) && Profit(-1,pGBPJPY)>0)
{o=OrderSend(pGBPJPY,OP_BUY,Lot_9,MarketInfo(pGBPJPY,MODE_ASK),10,0,0,comment,Magic,0,Green);}  
}
if(CountBar(-1,P_9)==0 && CountBarHist(-1,P_9)==0 && CountPair(OP_SELL,pGBPJPY,Magic)>0 && AccountFreeMarginCheck(pGBPJPY,OP_SELL,Lot_9)>0 && NowSell_9)
{if(MarketInfo(pGBPJPY,MODE_BID)+pGBPJPY_StepP*MarketInfo(pGBPJPY,MODE_POINT)<=OldPricS(pGBPJPY,Magic) && Profit(-1,pGBPJPY)>0)
{o=OrderSend(pGBPJPY,OP_SELL,Lot_9,MarketInfo(pGBPJPY,MODE_BID),10,0,0,comment,Magic,0,Red);}  
}
//-----------
}
}
//---
if(!ObjectGetInteger(0,"TRADEs_AU",OBJPROP_STATE))
{
double ProfProc=AllLots(-1)*ProfitPips;
if(ProfitAll(-1)>=ProfProc && ProfProc!=0)
{
ClosePos();
ObjectsDeleteAll(0,OBJ_ARROW);
ObjectsDeleteAll(0,OBJ_TREND);
}
}


if(ObjectGetInteger(0,"TRADEs_CN",OBJPROP_STATE))
{
if(TimeClose==0 && TimeHour(TimeCurrent())==TimeEnd)
{ClosePlusPair(P_1);
 ClosePlusPair(P_2);
 ClosePlusPair(P_3);
 ClosePlusPair(P_4);
 ClosePlusPair(P_5);
 ClosePlusPair(P_6);
 ClosePlusPair(P_7);
 ClosePlusPair(P_8);
 ClosePlusPair(P_9);
 TimeClose=1;}
 
if(TimeClose==1 && TimeHour(TimeCurrent())>=TimeStart && TimeHour(TimeCurrent())<TimeEnd)
{TimeClose=0;}
}

if(ObjectGetInteger(0,"TRADEs_MO",OBJPROP_STATE))
{

if(CountPair(-1,P_1,Magic)==0 && CountPair(OP_BUY,P_1,0)>0)
{o=OrderSend(P_1,OP_BUY,Lot_1,MarketInfo(P_1,MODE_ASK),10,0,0,comment,Magic,0,Green);}
if(CountPair(-1,P_1,Magic)==0 && CountPair(OP_SELL,P_1,0)>0)
{o=OrderSend(P_1,OP_SELL,Lot_1,MarketInfo(P_1,MODE_BID),10,0,0,comment,Magic,0,Green);}

if(CountPair(-1,P_2,Magic)==0 && CountPair(OP_BUY,P_2,0)>0)
{o=OrderSend(P_2,OP_BUY,Lot_1,MarketInfo(P_2,MODE_ASK),10,0,0,comment,Magic,0,Green);}
if(CountPair(-1,P_2,Magic)==0 && CountPair(OP_SELL,P_2,0)>0)
{o=OrderSend(P_2,OP_SELL,Lot_1,MarketInfo(P_2,MODE_BID),10,0,0,comment,Magic,0,Green);}

if(CountPair(-1,P_3,Magic)==0 && CountPair(OP_BUY,P_3,0)>0)
{o=OrderSend(P_3,OP_BUY,Lot_1,MarketInfo(P_3,MODE_ASK),10,0,0,comment,Magic,0,Green);}
if(CountPair(-1,P_3,Magic)==0 && CountPair(OP_SELL,P_3,0)>0)
{o=OrderSend(P_3,OP_SELL,Lot_1,MarketInfo(P_3,MODE_BID),10,0,0,comment,Magic,0,Green);}

if(CountPair(-1,P_4,Magic)==0 && CountPair(OP_BUY,P_4,0)>0)
{o=OrderSend(P_4,OP_BUY,Lot_1,MarketInfo(P_4,MODE_ASK),10,0,0,comment,Magic,0,Green);}
if(CountPair(-1,P_4,Magic)==0 && CountPair(OP_SELL,P_4,0)>0)
{o=OrderSend(P_4,OP_SELL,Lot_1,MarketInfo(P_4,MODE_BID),10,0,0,comment,Magic,0,Green);}

if(CountPair(-1,P_5,Magic)==0 && CountPair(OP_BUY,P_5,0)>0)
{o=OrderSend(P_5,OP_BUY,Lot_1,MarketInfo(P_5,MODE_ASK),10,0,0,comment,Magic,0,Green);}
if(CountPair(-1,P_5,Magic)==0 && CountPair(OP_SELL,P_5,0)>0)
{o=OrderSend(P_5,OP_SELL,Lot_1,MarketInfo(P_5,MODE_BID),10,0,0,comment,Magic,0,Green);}

if(CountPair(-1,P_6,Magic)==0 && CountPair(OP_BUY,P_6,0)>0)
{o=OrderSend(P_6,OP_BUY,Lot_1,MarketInfo(P_6,MODE_ASK),10,0,0,comment,Magic,0,Green);}
if(CountPair(-1,P_6,Magic)==0 && CountPair(OP_SELL,P_6,0)>0)
{o=OrderSend(P_6,OP_SELL,Lot_1,MarketInfo(P_6,MODE_BID),10,0,0,comment,Magic,0,Green);}

if(CountPair(-1,P_7,Magic)==0 && CountPair(OP_BUY,P_7,0)>0)
{o=OrderSend(P_7,OP_BUY,Lot_1,MarketInfo(P_7,MODE_ASK),10,0,0,comment,Magic,0,Green);}
if(CountPair(-1,P_7,Magic)==0 && CountPair(OP_SELL,P_7,0)>0)
{o=OrderSend(P_7,OP_SELL,Lot_1,MarketInfo(P_7,MODE_BID),10,0,0,comment,Magic,0,Green);}

if(CountPair(-1,P_8,Magic)==0 && CountPair(OP_BUY,P_8,0)>0)
{o=OrderSend(P_8,OP_BUY,Lot_1,MarketInfo(P_8,MODE_ASK),10,0,0,comment,Magic,0,Green);}
if(CountPair(-1,P_8,Magic)==0 && CountPair(OP_SELL,P_8,0)>0)
{o=OrderSend(P_8,OP_SELL,Lot_1,MarketInfo(P_8,MODE_BID),10,0,0,comment,Magic,0,Green);}

if(CountPair(-1,P_9,Magic)==0 && CountPair(OP_BUY,P_9,0)>0)
{o=OrderSend(P_9,OP_BUY,Lot_1,MarketInfo(P_9,MODE_ASK),10,0,0,comment,Magic,0,Green);}
if(CountPair(-1,P_9,Magic)==0 && CountPair(OP_SELL,P_9,0)>0)
{o=OrderSend(P_9,OP_SELL,Lot_1,MarketInfo(P_9,MODE_BID),10,0,0,comment,Magic,0,Green);}

if((CountPair(OP_BUY,P_1,Magic)>0 && CountPair(OP_SELL,P_1,0)>0) || (CountPair(OP_SELL,P_1,Magic)>0 && CountPair(OP_BUY,P_1,0)>0))
{ClosePosPair(P_1,Magic);
 ClosePosPair(P_1,0);}

if((CountPair(OP_BUY,P_2,Magic)>0 && CountPair(OP_SELL,P_2,0)>0) || (CountPair(OP_SELL,P_2,Magic)>0 && CountPair(OP_BUY,P_2,0)>0))
{ClosePosPair(P_2,Magic);
 ClosePosPair(P_2,0);}

if((CountPair(OP_BUY,P_3,Magic)>0 && CountPair(OP_SELL,P_3,0)>0) || (CountPair(OP_SELL,P_3,Magic)>0 && CountPair(OP_BUY,P_3,0)>0))
{ClosePosPair(P_3,Magic);
 ClosePosPair(P_3,0);}

if((CountPair(OP_BUY,P_4,Magic)>0 && CountPair(OP_SELL,P_4,0)>0) || (CountPair(OP_SELL,P_4,Magic)>0 && CountPair(OP_BUY,P_4,0)>0))
{ClosePosPair(P_4,Magic);
 ClosePosPair(P_4,0);}

if((CountPair(OP_BUY,P_5,Magic)>0 && CountPair(OP_SELL,P_5,0)>0) || (CountPair(OP_SELL,P_5,Magic)>0 && CountPair(OP_BUY,P_5,0)>0))
{ClosePosPair(P_5,Magic);
 ClosePosPair(P_5,0);}

if((CountPair(OP_BUY,P_6,Magic)>0 && CountPair(OP_SELL,P_6,0)>0) || (CountPair(OP_SELL,P_6,Magic)>0 && CountPair(OP_BUY,P_6,0)>0))
{ClosePosPair(P_6,Magic);
 ClosePosPair(P_6,0);}

if((CountPair(OP_BUY,P_7,Magic)>0 && CountPair(OP_SELL,P_7,0)>0) || (CountPair(OP_SELL,P_7,Magic)>0 && CountPair(OP_BUY,P_7,0)>0))
{ClosePosPair(P_7,Magic);
 ClosePosPair(P_7,0);}

if((CountPair(OP_BUY,P_8,Magic)>0 && CountPair(OP_SELL,P_8,0)>0) || (CountPair(OP_SELL,P_8,Magic)>0 && CountPair(OP_BUY,P_8,0)>0))
{ClosePosPair(P_8,Magic);
 ClosePosPair(P_8,0);}

if((CountPair(OP_BUY,P_9,Magic)>0 && CountPair(OP_SELL,P_9,0)>0) || (CountPair(OP_SELL,P_9,Magic)>0 && CountPair(OP_BUY,P_9,0)>0))
{ClosePosPair(P_9,Magic);
 ClosePosPair(P_9,0);}

if(CountPair(-1,MobClosPair,0)>0)
{ClosePos(Magic);
 ClosePosPair(MobClosPair,0);}
}

double LossProc=(AccountBalance()/100)*StopLossProcent*(-1);
if(ProfitAll(-1)<LossProc && LossProc!=0)
{
ClosePos(Magic);
ObjectsDeleteAll(0,OBJ_ARROW);
ObjectsDeleteAll(0,OBJ_TREND);
}

if (AccountInfoDouble(ACCOUNT_PROFIT) >= AccountInfoDouble(ACCOUNT_BALANCE) * lucro_maximo_percentual / 100.0) {
        // Fecha todas as posições abertas
        CloseAllPositions();
        // Desativa a estratégia
        estrategia_ativa = false;
        return;
    }

    // Verifica se a perda máxima foi atingida
 if (AccountInfoDouble(ACCOUNT_PROFIT) <= -AccountInfoDouble(ACCOUNT_BALANCE) * perda_maxima_percentual / 100.0) {
        // Fecha todas as posições abertas
        CloseAllPositions();
        // Desativa a estratégia
        estrategia_ativa = false;
        return;
    }
//+------------------------------------------------------------------+


if(!ObjectGetInteger(0,"TRADEs_P1",OBJPROP_STATE) &&
    !ObjectGetInteger(0,"TRADEs_P2",OBJPROP_STATE) &&
    !ObjectGetInteger(0,"TRADEs_P3",OBJPROP_STATE) &&
    !ObjectGetInteger(0,"TRADEs_P4",OBJPROP_STATE) &&
    !ObjectGetInteger(0,"TRADEs_P5",OBJPROP_STATE) &&
    !ObjectGetInteger(0,"TRADEs_P6",OBJPROP_STATE) &&
    !ObjectGetInteger(0,"TRADEs_P7",OBJPROP_STATE) &&
    !ObjectGetInteger(0,"TRADEs_P8",OBJPROP_STATE) &&
    !ObjectGetInteger(0,"TRADEs_P9",OBJPROP_STATE))
  {PairName=Symbol();}
if(ObjectGetInteger(0,"TRADEs_P1",OBJPROP_STATE))
  {PairName=P_1;}
if(ObjectGetInteger(0,"TRADEs_P2",OBJPROP_STATE))
  {PairName=P_2;}
if(ObjectGetInteger(0,"TRADEs_P3",OBJPROP_STATE))
  {PairName=P_3;}
if(ObjectGetInteger(0,"TRADEs_P4",OBJPROP_STATE))
  {PairName=P_4;}
if(ObjectGetInteger(0,"TRADEs_P5",OBJPROP_STATE))
  {PairName=P_5;}
if(ObjectGetInteger(0,"TRADEs_P6",OBJPROP_STATE))
  {PairName=P_6;}
if(ObjectGetInteger(0,"TRADEs_P7",OBJPROP_STATE))
  {PairName=P_7;}
if(ObjectGetInteger(0,"TRADEs_P8",OBJPROP_STATE))
  {PairName=P_8;}
if(ObjectGetInteger(0,"TRADEs_P9",OBJPROP_STATE))
  {PairName=P_9;}
//+------------------------------------------------------------------+
   


if(!ObjectGetInteger(0,"INFO_Button",OBJPROP_STATE))
{ 

}
//+------------------------------------------------------------------+
if(!ObjectGetInteger(0,"TRADE_Button",OBJPROP_STATE))
{


} 
//---
}
}
}
//+------------------------------------------------------------------+
void OnChartEvent(const int id, const long &lparam, const double &dparam, const string &sparam)
{

if(ObjectGetInteger(0,"INFO_Button",OBJPROP_STATE))
{ObjectsDeleteAll(0,"INFO_",EMPTY,OBJ_RECTANGLE_LABEL);
   ObjectsDeleteAll(0,"INFO_",EMPTY,OBJ_LABEL);
   PutButtonInfo("SVERNUT_",70,15,"INFO",1);}

if(ObjectGetInteger(0,"SVERNUT_",OBJPROP_STATE))
{ObjectsDeleteAll(0,"INFO_",EMPTY,OBJ_BUTTON);
ObjectsDeleteAll(0,"SVERNUT_",EMPTY,OBJ_BUTTON);}

if(ObjectGetInteger(0,"TRADE_Button",OBJPROP_STATE))
{ObjectsDeleteAll(0,"TRADE_",EMPTY,OBJ_RECTANGLE_LABEL);
 ObjectsDeleteAll(0,"TRADEs_",EMPTY,OBJ_BUTTON);
   ObjectsDeleteAll(0,"TRADE_",EMPTY,OBJ_LABEL);
   ObjectsDeleteAll(0,"TRADE_",EMPTY,OBJ_EDIT);
   PutButtonInfo("SVERNUTt_",5,15,"TRADE",0);}

if(ObjectGetInteger(0,"SVERNUTt_",OBJPROP_STATE))
{ObjectsDeleteAll(0,"TRADE_",EMPTY,OBJ_BUTTON);
ObjectsDeleteAll(0,"SVERNUTt_",EMPTY,OBJ_BUTTON);}

//+------------------------------------------------------------------+
if(ObjectGetInteger(0,"TRADEs_B",OBJPROP_STATE))
 {ObjectSetInteger(0,"TRADEs_B",OBJPROP_BGCOLOR,ClickButton);}
else 
 {ObjectSetInteger(0,"TRADEs_B",OBJPROP_BGCOLOR,FonButtonBuy);}
//------------------ 
if(ObjectGetInteger(0,"TRADEs_S",OBJPROP_STATE))
 {ObjectSetInteger(0,"TRADEs_S",OBJPROP_BGCOLOR,ClickButton);}
else 
 {ObjectSetInteger(0,"TRADEs_S",OBJPROP_BGCOLOR,FonButtonSell);}
//------------------
if(ObjectGetInteger(0,"TRADEs_CP",OBJPROP_STATE))
 {ObjectSetInteger(0,"TRADEs_CP",OBJPROP_BGCOLOR,ClickButton);}
else 
 {ObjectSetInteger(0,"TRADEs_CP",OBJPROP_BGCOLOR,FonButton);}
//------------------
if(ObjectGetInteger(0,"TRADEs_CM",OBJPROP_STATE))
 {ObjectSetInteger(0,"TRADEs_CM",OBJPROP_BGCOLOR,ClickButton);}
else 
 {ObjectSetInteger(0,"TRADEs_CM",OBJPROP_BGCOLOR,FonButton);}
//------------------
if(ObjectGetInteger(0,"TRADEs_CA",OBJPROP_STATE))
 {ObjectSetInteger(0,"TRADEs_CA",OBJPROP_BGCOLOR,ClickButton);}
else 
 {ObjectSetInteger(0,"TRADEs_CA",OBJPROP_BGCOLOR,FonButton);}
//------------------
if(ObjectGetInteger(0,"TRADEs_CO",OBJPROP_STATE))
 {ObjectSetInteger(0,"TRADEs_CO",OBJPROP_BGCOLOR,ClickButton);}
else 
 {ObjectSetInteger(0,"TRADEs_CO",OBJPROP_BGCOLOR,FonButton);}   
//+------------------------------------------------------------------+
if(id==CHARTEVENT_OBJECT_CLICK)
{string clickedChartObject=sparam;

if(clickedChartObject=="TRADEs_B")
  {o=OrderSend(PairName,OP_BUY,Lot_1,MarketInfo(PairName,MODE_ASK),10,0,0,comment,Magic,0,Green);       
   ObjectSetInteger(0,"TRADEs_B",OBJPROP_STATE,false);}
if(clickedChartObject=="TRADEs_S")
  {o=OrderSend(PairName,OP_SELL,Lot_1,MarketInfo(PairName,MODE_BID),10,0,0,comment,Magic,0,Red);
   ObjectSetInteger(0,"TRADEs_S",OBJPROP_STATE,false);}

if(clickedChartObject=="TRADEs_CP")
  {ObjectSetString(0,"TRADEs_CP",OBJPROP_TEXT,TextOn);
   ClosePlusPair(PairName);
   ObjectsDeleteAll(0,OBJ_ARROW);
   ObjectsDeleteAll(0,OBJ_TREND);
   ObjectSetInteger(0,"TRADEs_CP",OBJPROP_STATE,false);}
   
if(clickedChartObject=="TRADEs_CM")
  {ObjectSetString(0,"TRADEs_CM",OBJPROP_TEXT,TextOn);
   CloseMinusPair(PairName);
   ObjectsDeleteAll(0,OBJ_ARROW);
   ObjectsDeleteAll(0,OBJ_TREND);
   ObjectSetInteger(0,"TRADEs_CM",OBJPROP_STATE,false);}

if(clickedChartObject=="TRADEs_CA")
  {ObjectSetString(0,"TRADEs_CA",OBJPROP_TEXT,TextOn);
   ClosePosPair(PairName);
   ObjectsDeleteAll(0,OBJ_ARROW);
   ObjectsDeleteAll(0,OBJ_TREND);
   ObjectSetInteger(0,"TRADEs_CA",OBJPROP_STATE,false);}
   
if(clickedChartObject=="TRADEs_CO")
  {ObjectSetString(0,"TRADEs_CO",OBJPROP_TEXT,TextOn);
   ClosePos();
   ObjectsDeleteAll(0,OBJ_ARROW);
   ObjectsDeleteAll(0,OBJ_TREND);
   ObjectSetInteger(0,"TRADEs_CO",OBJPROP_STATE,false);}

//------------------------
if(clickedChartObject=="TRADEs_P1")
  {ObjectSetInteger(0,"TRADEs_P2",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P3",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P4",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P5",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P6",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P7",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P8",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P9",OBJPROP_STATE,false);}
//-----------------   
if(clickedChartObject=="TRADEs_P2")
  {ObjectSetInteger(0,"TRADEs_P1",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P3",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P4",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P5",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P6",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P7",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P8",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P9",OBJPROP_STATE,false);}
//-----------------   
if(clickedChartObject=="TRADEs_P3")
  {ObjectSetInteger(0,"TRADEs_P2",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P1",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P4",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P5",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P6",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P7",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P8",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P9",OBJPROP_STATE,false);}
//-----------------   
if(clickedChartObject=="TRADEs_P4")
  {ObjectSetInteger(0,"TRADEs_P2",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P3",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P1",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P5",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P6",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P7",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P8",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P9",OBJPROP_STATE,false);}
//-----------------   
if(clickedChartObject=="TRADEs_P5")
  {ObjectSetInteger(0,"TRADEs_P2",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P3",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P4",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P1",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P6",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P7",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P8",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P9",OBJPROP_STATE,false);}
//-----------------   
if(clickedChartObject=="TRADEs_P6")
  {ObjectSetInteger(0,"TRADEs_P2",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P3",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P4",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P5",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P1",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P7",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P8",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P9",OBJPROP_STATE,false);}
//-----------------   
if(clickedChartObject=="TRADEs_P7")
  {ObjectSetInteger(0,"TRADEs_P2",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P3",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P4",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P5",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P6",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P1",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P8",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P9",OBJPROP_STATE,false);}
//-----------------   
if(clickedChartObject=="TRADEs_P8")
  {ObjectSetInteger(0,"TRADEs_P2",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P3",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P4",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P5",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P6",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P7",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P1",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P9",OBJPROP_STATE,false);}
//-----------------   
if(clickedChartObject=="TRADEs_P9")
  {ObjectSetInteger(0,"TRADEs_P2",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P3",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P4",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P5",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P6",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P7",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P8",OBJPROP_STATE,false);
   ObjectSetInteger(0,"TRADEs_P1",OBJPROP_STATE,false);}
//-----------------   



ChartRedraw();
}}
//+------------------------------------------------------------------+

bool RectLabelCreate(string  name, int x,int y, int width, int height, color back_clr, int space)
  {ResetLastError(); 
if(!ObjectCreate(0,name,OBJ_RECTANGLE_LABEL,0,0,0)) 
  {return(false);} 
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x); 
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y); 
   ObjectSetInteger(0,name,OBJPROP_XSIZE,width); 
   ObjectSetInteger(0,name,OBJPROP_YSIZE,height); 
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,back_clr); 
   ObjectSetInteger(0,name,OBJPROP_BORDER_TYPE,BORDER_SUNKEN); 
   ObjectSetInteger(0,name,OBJPROP_CORNER,space); 
   ObjectSetInteger(0,name,OBJPROP_COLOR,Blue); 
   ObjectSetInteger(0,name,OBJPROP_WIDTH,1); 
   ObjectSetInteger(0,name,OBJPROP_BACK,false); 
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false); 
return(true);} 


void PutButton(string name,int x,int y,string text, int space)
  {ObjectCreate(0,name,OBJ_BUTTON,0,0,0);
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
   ObjectSetInteger(0,name,OBJPROP_XSIZE,BWidth);
   ObjectSetInteger(0,name,OBJPROP_YSIZE,BHeigh);
   ObjectSetInteger(0,name,OBJPROP_CORNER,space);
   ObjectSetString(0,name,OBJPROP_TEXT,text);
   ObjectSetString(0,name,OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,FontSizeInfo);
   ObjectSetInteger(0,name,OBJPROP_COLOR,TXTButton);
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,ClickButton);
   ObjectSetInteger(0,name,OBJPROP_BORDER_COLOR,ButtonBorder);
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false);
   ObjectSetInteger(0,name,OBJPROP_BACK,false);}
   

void PutLabelT(string name,int x,int y,string text, int space)
  {ObjectCreate(0,name,OBJ_LABEL,0,0,0);
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
   ObjectSetInteger(0,name,OBJPROP_CORNER, space);
   ObjectSetString(0,name,OBJPROP_TEXT,text);
   ObjectSetString(0,name,OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,FontSizeInfo);
   ObjectSetInteger(0,name,OBJPROP_COLOR,TextColor);
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false);
   ObjectSetInteger(0,name,OBJPROP_BACK,false);}
   

void PutLabelDt(string name,int x,int y,string text,int space)
  {ObjectCreate(0,name,OBJ_LABEL,0,0,0);
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
   ObjectSetInteger(0,name,OBJPROP_CORNER,space);
   ObjectSetString(0,name,OBJPROP_TEXT,text);
   ObjectSetString(0,name,OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,FontSizeInfo);
   ObjectSetInteger(0,name,OBJPROP_COLOR,InfoDataColorText);
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false);
   ObjectSetInteger(0,name,OBJPROP_BACK,false);}
   

void PutLabelD(string name,int x,int y,string data,int space)
  {ObjectCreate(0,name,OBJ_LABEL,0,0,0);
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
   ObjectSetInteger(0,name,OBJPROP_CORNER,space);
   ObjectSetString(0,name,OBJPROP_TEXT,data);
   ObjectSetString(0,name,OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,FontSizeInfo);
   ObjectSetInteger(0,name,OBJPROP_COLOR,InfoDataColor);
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false);
   ObjectSetInteger(0,name,OBJPROP_BACK,false);}

  
void PutButtonInfo(string name,int x,int y,string text, int space)
  {ObjectCreate(0,name,OBJ_BUTTON,0,0,0);
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
   ObjectSetInteger(0,name,OBJPROP_XSIZE,BWidth);
   ObjectSetInteger(0,name,OBJPROP_YSIZE,BHeigh);
   ObjectSetInteger(0,name,OBJPROP_CORNER,space);
   ObjectSetString(0,name,OBJPROP_TEXT,text);
   ObjectSetString(0,name,OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,FontSizeInfo);
   ObjectSetInteger(0,name,OBJPROP_COLOR,TXTButton);
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,FonButtonInfo);
   ObjectSetInteger(0,name,OBJPROP_BORDER_COLOR,ButtonBorder);
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false);
   ObjectSetInteger(0,name,OBJPROP_BACK,false);}
   

void PutButtonBS(string name,int x,int y,string text,int BWidth2,int BHeigh2,color FonButtonBS,color TXTButtonBS)
  {ObjectCreate(0,name,OBJ_BUTTON,0,0,0);
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
   ObjectSetInteger(0,name,OBJPROP_XSIZE,BWidth2);
   ObjectSetInteger(0,name,OBJPROP_YSIZE,BHeigh2);
   ObjectSetInteger(0,name,OBJPROP_CORNER,0);
   ObjectSetString(0,name,OBJPROP_TEXT,text);
   ObjectSetString(0,name,OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,FontSize);
   ObjectSetInteger(0,name,OBJPROP_COLOR,TXTButtonBS);
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,FonButtonBS);
   ObjectSetInteger(0,name,OBJPROP_BORDER_COLOR,ButtonBorder);
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false);
   ObjectSetInteger(0,name,OBJPROP_BACK,false);
  }
  

void PutButtonER(string name,int x,int y,string text,int BWidth2,int BHeigh2)
  {ObjectCreate(0,name,OBJ_BUTTON,0,0,0);
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
   ObjectSetInteger(0,name,OBJPROP_XSIZE,BWidth2);
   ObjectSetInteger(0,name,OBJPROP_YSIZE,BHeigh2);
   ObjectSetInteger(0,name,OBJPROP_CORNER,0);
   ObjectSetString(0,name,OBJPROP_TEXT,text);
   ObjectSetString(0,name,OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,FontSize);
   ObjectSetInteger(0,name,OBJPROP_COLOR,TXTButton);
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,FonButton);
   ObjectSetInteger(0,name,OBJPROP_BORDER_COLOR,ButtonBorder);
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false);
   ObjectSetInteger(0,name,OBJPROP_BACK,false);
  }


void PutButtonPair(string name,int x,int y,string text,int BWidth2,int BHeigh2)
  {ObjectCreate(0,name,OBJ_BUTTON,0,0,0);
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
   ObjectSetInteger(0,name,OBJPROP_XSIZE,BWidth2);
   ObjectSetInteger(0,name,OBJPROP_YSIZE,BHeigh2);
   ObjectSetInteger(0,name,OBJPROP_CORNER,0);
   ObjectSetString(0,name,OBJPROP_TEXT,text);
   ObjectSetString(0,name,OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,FontSize);
   ObjectSetInteger(0,name,OBJPROP_COLOR,TXTButton);
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,FonButton);
   ObjectSetInteger(0,name,OBJPROP_BORDER_COLOR,ButtonBorder);
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false);
   ObjectSetInteger(0,name,OBJPROP_BACK,false);
  }
void PutEdit(string name,int x,int y,string text, int width, int heigh)
{ObjectCreate(0,name,OBJ_EDIT,0,0,0);
ObjectSetInteger(0,name,OBJPROP_XDISTANCE,x);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,y);
   ObjectSetInteger(0,name,OBJPROP_XSIZE,width);
   ObjectSetInteger(0,name,OBJPROP_YSIZE,heigh);
   ObjectSetString(0,name,OBJPROP_TEXT,text);
   ObjectSetString(0,name,OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,FontSize);
   ObjectSetInteger(0,name,OBJPROP_ALIGN,ALIGN_CENTER);
   ObjectSetInteger(0,name,OBJPROP_READONLY,false);
   ObjectSetInteger(0,name,OBJPROP_CORNER,0);
   ObjectSetInteger(0,name,OBJPROP_COLOR,TXTButton);
   ObjectSetInteger(0,name,OBJPROP_BGCOLOR,EditColor);
   ObjectSetInteger(0,name,OBJPROP_BORDER_COLOR,ButtonBorder);
   ObjectSetInteger(0,name,OBJPROP_HIDDEN,false);
   ObjectSetInteger(0,name,OBJPROP_BACK,false);}
//+------------------------------------------------------------------+

double Profit(int type, string symb="") 
{double Profit = 0;
 for (int cnt = OrdersTotal() - 1; cnt >= 0; cnt--) {
 if(OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES))
{if (symb==OrderSymbol() && OrderMagicNumber()==Magic && (OrderType() == type || type==-1)) Profit += OrderProfit()+OrderSwap()+OrderCommission();}}
return (Profit);} 


double ProfitAll(int type) 
{double Profit = 0;
   for (int cnt = OrdersTotal() - 1; cnt >= 0; cnt--) {
      if(OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES))
      {if (OrderMagicNumber()==Magic && (OrderType() == type || type==-1)) Profit += OrderProfit()+OrderSwap()+OrderCommission();}}
       return (Profit);}
       

double ProfitDey(int type) 
{double Profit = 0;
   for (int cnt = OrdersHistoryTotal() - 1; cnt >= 0; cnt--) {
      if(OrderSelect(cnt, SELECT_BY_POS, MODE_HISTORY))
      {if (OrderMagicNumber()==Magic && OrderCloseTime()>=iTime(Symbol(),1440,0) && (OrderType() == type || type==-1)) Profit += OrderProfit()+OrderSwap()+OrderCommission();}}
       return (Profit);}
                       

double ProfitTuDey(int type) 
{double Profit = 0;
   for (int cnt = OrdersHistoryTotal() - 1; cnt >= 0; cnt--) {
      if(OrderSelect(cnt, SELECT_BY_POS, MODE_HISTORY))
      {if (OrderMagicNumber()==Magic && OrderCloseTime()>=iTime(Symbol(),1440,1) && OrderCloseTime()<iTime(Symbol(),1440,0) && (OrderType() == type || type==-1)) Profit += OrderProfit()+OrderSwap()+OrderCommission();}}
       return (Profit);}
       

double ProfitEsTuDey(int type) 
{double Profit = 0;
   for (int cnt = OrdersHistoryTotal() - 1; cnt >= 0; cnt--) {
      if(OrderSelect(cnt, SELECT_BY_POS, MODE_HISTORY))
      {if (OrderMagicNumber()==Magic && OrderCloseTime()>=iTime(Symbol(),1440,2) && OrderCloseTime()<iTime(Symbol(),1440,1) && (OrderType() == type || type==-1)) Profit += OrderProfit()+OrderSwap()+OrderCommission();}}
       return (Profit);}
                  

double ProfitWeek(int type) 
{double Profit = 0;
   for (int cnt = OrdersHistoryTotal() - 1; cnt >= 0; cnt--) {
      if(OrderSelect(cnt, SELECT_BY_POS, MODE_HISTORY))
      {if (OrderMagicNumber()==Magic && OrderCloseTime()>=iTime(Symbol(),10080,0) && (OrderType() == type || type==-1)) Profit += OrderProfit()+OrderSwap()+OrderCommission();}}
       return (Profit);}
         

double ProfitMontag(int type) 
{double Profit = 0;
   for (int cnt = OrdersHistoryTotal() - 1; cnt >= 0; cnt--) {
      if(OrderSelect(cnt, SELECT_BY_POS, MODE_HISTORY))
      {if (OrderMagicNumber()==Magic && OrderCloseTime()>=iTime(Symbol(),43200,0) && (OrderType() == type || type==-1)) Profit += OrderProfit()+OrderSwap()+OrderCommission();}}
       return (Profit);}


int CountAll(int type)
{
int count=0;
for(int i=OrdersTotal()-1;i>=0;i--)
 if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
  {
  if(OrderMagicNumber()==Magic &&  (type==-1 || OrderType()==type)) 
  {
  count++;
  }
  }
return(count);}
 

int CountPair(int type, string sym, int key)
{
int count=0;
for(int i=OrdersTotal()-1;i>=0;i--)
 if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
  {
  if(OrderSymbol()==sym && key==OrderMagicNumber() && (type==-1 || OrderType()==type)) 
  {
  count++;
  }
  }
return(count);} 


int CountPairPlus(int type, string sym, int key)
{
int count=0;
for(int i=OrdersTotal()-1;i>=0;i--)
 if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
  {
  if(OrderSymbol()==sym && key==OrderMagicNumber() && OrderProfit()+OrderSwap()+OrderCommission()>0 && (type==-1 || OrderType()==type)) 
  {
  count++;
  }
  }
return(count);} 


int CountPairMinus(int type, string sym, int key)
{
int count=0;
for(int i=OrdersTotal()-1;i>=0;i--)
 if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
  {
  if(OrderSymbol()==sym && key==OrderMagicNumber() && OrderProfit()+OrderSwap()+OrderCommission()<0 && (type==-1 || OrderType()==type)) 
  {
  count++;
  }
  }
return(count);} 
int CountBar(int type, string sym)
{
int count=0;
for(int i=OrdersTotal()-1;i>=0;i--)
 if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
  {
  if(OrderSymbol()==sym &&  OrderMagicNumber()==Magic && OrderOpenTime()>=iTime(sym,1,0) && (type==-1 || OrderType()==type)) 
  {
  count++;
  }
  }
return(count);}
int CountBarHist(int type, string sym)
{
int count=0;
for(int i=OrdersHistoryTotal()-1;i>=0;i--)
 if(OrderSelect(i,SELECT_BY_POS,MODE_HISTORY))
  {
  if(OrderSymbol()==sym &&  OrderMagicNumber()==Magic && OrderOpenTime()>=iTime(sym,1,0) && OrderCloseTime()>=iTime(sym,1,0) && (type==-1 || OrderType()==type)) 
  {
  count++;
  }
  }
return(count);}

void ClosePos()
{bool cl;
 for(int i=OrdersTotal()-1;i>=0;i--)
{if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
{if(OrderMagicNumber()==Magic)
{if(OrderType()==0)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(OrderSymbol(),MODE_BID),Digits),10,White);}
if(OrderType()==1)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(OrderSymbol(),MODE_ASK),Digits),10,White);}}}}}


void ClosePosPair(string sym, int key)
{bool cl;
 for(int i=OrdersTotal()-1;i>=0;i--)
{if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
{if(OrderSymbol()==sym && OrderMagicNumber()==key)
{if(OrderType()==0)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(sym,MODE_BID),Digits),10,White);}
if(OrderType()==1)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(sym,MODE_ASK),Digits),10,White);}}}}}
 

void ClosePos(int key)
{bool cl;
 for(int i=OrdersTotal()-1;i>=0;i--)
{if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
{if(OrderMagicNumber()==key)
{if(OrderType()==0)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(OrderSymbol(),MODE_BID),Digits),10,White);}
if(OrderType()==1)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(OrderSymbol(),MODE_ASK),Digits),10,White);}}}}}


void ClosePosPair(string sym)
{bool cl;
 for(int i=OrdersTotal()-1;i>=0;i--)
{if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
{if(OrderSymbol()==sym && OrderMagicNumber()==Magic)
{if(OrderType()==0)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(sym,MODE_BID),Digits),10,White);}
if(OrderType()==1)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(sym,MODE_ASK),Digits),10,White);}}}}}
 

void ClosePlusPair(string sym)
{bool cl;
 for(int i=OrdersTotal()-1;i>=0;i--)
{if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
{if(OrderSymbol()==sym && OrderMagicNumber()==Magic && OrderProfit()+OrderCommission()+OrderSwap()>0)
{if(OrderType()==0)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(sym,MODE_BID),Digits),10,White);}
if(OrderType()==1)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(sym,MODE_ASK),Digits),10,White);}}}}}
 
 
void CloseMinusPair(string sym)
{bool cl;
 for(int i=OrdersTotal()-1;i>=0;i--)
{if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
{if(OrderSymbol()==sym && OrderMagicNumber()==Magic && OrderProfit()+OrderCommission()+OrderSwap()<0)
{if(OrderType()==0)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(sym,MODE_BID),Digits),10,White);}
if(OrderType()==1)
{RefreshRates();
 cl=OrderClose(OrderTicket(),OrderLots(),NormalizeDouble(MarketInfo(sym,MODE_ASK),Digits),10,White);}}}}} 

double OldPricB(string sy, int key) 
{double oldorderopenpriceB=0;
   int oldticketnumberB;
   double unusedB = 0;
   int ticketnumberB = 0;
for (int cnt = OrdersTotal() - 1; cnt >= 0; cnt--) 
   {if(OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES))
       {if (OrderSymbol() == sy && OrderMagicNumber() == key && OrderType() == OP_BUY) 
         {oldticketnumberB = OrderTicket();
         if(oldticketnumberB > ticketnumberB) 
           {ticketnumberB = oldticketnumberB;
            oldorderopenpriceB = OrderOpenPrice();
            unusedB = oldorderopenpriceB;}}}}                          
return (oldorderopenpriceB);}

//---

double OldPricS(string sy, int key) 
{double oldorderopenpriceS=0;
   int oldticketnumberS;
   double unusedS = 0;
   int ticketnumberS = 0;
for (int cnt = OrdersTotal() - 1; cnt >= 0; cnt--) 
   {if(OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES))
       {if (OrderSymbol() == sy && OrderMagicNumber() == key && OrderType() == OP_SELL) 
         {oldticketnumberS = OrderTicket();
         if(oldticketnumberS > ticketnumberS) 
           {ticketnumberS = oldticketnumberS;
            oldorderopenpriceS = OrderOpenPrice();
            unusedS = oldorderopenpriceS;}}}}                                
return (oldorderopenpriceS);}


double LastLot(int type, string sym)
{double lot=0;
datetime dt=0;
for(int i=OrdersTotal()-1;i>=0;i--)
 if(OrderSelect(i,SELECT_BY_POS,MODE_TRADES))
  {if(OrderSymbol()==sym && OrderMagicNumber()==Magic && (type==-1 || OrderType()==type)) 
   {if(OrderOpenTime()>dt)
   {dt=OrderOpenTime();
    lot=OrderLots();}}}
return(lot);}


double AllLots(int type) 
{double lot = 0;
   for (int cnt = OrdersTotal() - 1; cnt >= 0; cnt--) {
      if(OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES))
      {if (OrderMagicNumber()==Magic && (OrderType() == type || type==-1)) lot += OrderLots();}}
       return (lot);}

datetime FirstOrderTime()
{
datetime time=0;
int tic=0;
for(int i=OrdersHistoryTotal()-1;i>=0;i--)
 if(OrderSelect(i,SELECT_BY_POS,MODE_HISTORY))
  {
  if(OrderComment()==comment && (OrderTicket()<tic || tic==0))  
  {
  time=OrderOpenTime();
  }
  }
return(time);}
     

void OnTimer()
  {
   RefreshRates();
   OnTick();
  }