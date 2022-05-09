pragma circom 2.0.0;

// [assignment] Modify the circuit below to perform a multiplication of three signals

// template Multiplier2 takes in 2 input and generates output signal as multiplication of inputs. 
template Multiplier2() {
    signal input in1;
    signal input in2;
    signal output out;
    out <== in1 * in2;
}

template Multiplier3 () {  

   // Declaration of signals.  
   signal input a;  
   signal input b;
   signal input c;
   signal output d;  

    // Constraints.  
    // d <== a * b * c;  

    // The above constraint is a polynoial of degree 3. 
    // To convert this to a quadratic polynomial (degree: 2), we can rewrite the 
    // constraints by splitting it into multiple statements as follows.
    // d <== m1 * c, where m1 <== a * b

    // Components added into circuit to multiply 2 numbers at a time. 
    component m1 = Multiplier2();
    component m2 = Multiplier2();
    // initializing first multiplier component with 2 signals a & b. 
    // m1 = a * b
    m1.in1 <== a;
    m1.in2 <== b;
    // initializing the secong multiplier with last signal c and output of first multiplier. 
    // m2 = m1 * c
    m2.in1 <== m1.out;
    m2.in2 <== c;
    // Assigning output of multiplier 2 to d
    // d = m2
    d <== m2.out;

}

component main = Multiplier3();