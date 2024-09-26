pragma circom 2.0.0; 

template dheera_jnode () 
{  

    //signal inputs
    signal input a;  
    signal input b; 

    //signals from gates
    signal x;  
    signal y; 

    //final signal output
    signal output Q; 
    

    //component gate used to create custom circuit
     component andGate = AND();
     component notGate = NOT();
     component orGate = OR();

    //circuit logic
    andGate.A <== a;
    andGate.B <== b;
    x <== andGate.out;
  
    notGate.A <== b;
    y <== notGate.out;

    orGate.A <==x;
    orGate.B <==y;
    Q <== orGate.out; 
    
}

template AND() {
  signal input A;
  signal input B;
  signal output out;

  out <== A * B;
}

template NOT() {
  signal input A;
  signal output out;

  out <== 1 + A - 2 * A;
}

template OR() {
  signal input A;
  signal input B;
  signal output out;

  out <== A + B - A * B;
}

component main = dheera_jnode ();
