module eixo(){
difference(){
cylinder(r=1.5,h=12,$fn=30);
   translate([-2,1,-2])  cube ([4,1,14]);
}
}

difference(){
union(){
difference(){
    cylinder(r=12, h=8,$fn=60);
translate([0,0,3]) cylinder(r=9, h=8,$fn=100);
    difference(){
  translate([0,0,1])  cylinder(r=13, h=6,$fn=100);
translate([0,0,1]) cylinder(r=11, h=6,$fn=100);
}
}

 cylinder(r=3, h=8,$fn=60);
}

translate([0,0,-1]) eixo();
}



