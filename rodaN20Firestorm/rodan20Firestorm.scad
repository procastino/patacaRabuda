anchoRoda=8;
radio=12;
radioEixo=1.7;

difference(){
union(){
difference(){
    //cilindro exterior
    cylinder(r=radio, h=anchoRoda,$fn=60);
    //cylindro oco
    translate([0,0,3]) cylinder(r=radio-2, h=anchoRoda,$fn=100);
}

//cilindro portaeixo 
cylinder(r=radioEixo*2.5, h=anchoRoda,$fn=60);
}

translate([0,0,-1]) eixo();
translate([-0.3,-10,0]) cube([0.6,10,8]);
}



module eixo(){
difference(){
cylinder(r=radioEixo,h=12,$fn=30);
translate([-2,1,-2])  cube ([4,1,14]);
}
}