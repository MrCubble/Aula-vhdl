//portas
// 0   1   2   3   4     5    6           7     8   9   10  11  12  13
// S3  S2  S1  S0  Modo  Cin  memToReg(0) Wr1   Wr0 A1  A0  B1  B0  CLOCK
// ou
// S3  S2  S1  S0  Modo  Cin  memToReg(1) Wr1   Wr0 I3  I2  I1  I0  CLOCK
// sendo I o imediato

void setup() {
  // inicializa os pinos como OUTPUT e deixa tudo LOW
  for (byte i = 0; i <= 13; i++) {
    pinMode(i, OUTPUT);
    digitalWrite(i, LOW);
  }
  pinMode(A0, OUTPUT);
  pinMode(A1, OUTPUT);
  // inicializa o serial
  Serial.begin(9600);
  Serial.println("Formato do comando (Operação da ula): {S3, S2, S1, S0, Modo, Cin, Wr1, 1, Wr0, A1, A0, B1, B0}");
  Serial.println("Formato do comando (Guardar imediato): {X, X, X, X, X, X, Wr1, 1, Wr0, imediato3, imediato2, imediato1, imediato0}");
  Serial.println("Ambos sem espaços, virgulas e chaves.");
  Serial.println("Ex:0101010101110");
}
// ve se a string é valida
byte valida(String comando){
  // a string deve ter tamanho 13 e so pode conter 0s e 1s
  if(comando.length() != 13) return 0;
  for(int i=0; i<13; i++) if(comando[i]!='0' && comando[i]!='1') return 0;
  return 1;
}
void updateClock(){
// desce, sobe
  digitalWrite(13, LOW);
  delay(50);
  digitalWrite(13, HIGH);
}
//principal
void loop() {
    Serial.println("Digite o comando: ");
    while(Serial.available() == 0);
      String comando = Serial.readString();
      Serial.println(comando);
      if(comando=="clock") updateClock();
      else if(!valida(comando)) Serial.println("A string deve ter tamanho 13 e so pode conter 0s e 1s.");
      else{
        for(byte i=0; i<13; i++) digitalWrite(i, comando[i] - '0');//, Serial.println("Porta " + (String)i + " = " + (String)comando[i]);
        updateClock();
    
        Serial.println("Comando executado.");
      }
    
}
