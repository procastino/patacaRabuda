longoBase=90;
alto=35;
inclinacion=30;
thick=2.5;
radioRoda=13;
anchoRoda=10;
anchoBrida=4;
thickBrida=1;

difference(){
exterior();
interior(3);
//ocos das rodas
translate ([-50+2*thick,longoBase-radioRoda*2-4,0]) ocoRoda();
translate ([50-anchoRoda-2-2*thick,longoBase-radioRoda*2-4,0]) ocoRoda();
//ocos bridas motores
translate([-23,longoBase-radioRoda-10,-1]) furados();
translate([11,longoBase-radioRoda-10,-1]) furados();
//ocos parafusos base
translate([44,10,1]) rotate([30,0,0]) cylinder(r=1,h=10,$fn=10);
     translate([-44,10,1]) rotate([30,0,0]) cylinder(r=1,h=10,$fn=10);
}
translate([-50+thick,longoBase+10-thick-2,alto-14]) fixaVertical();
translate([50-thick,longoBase+10-thick-2,alto-14]) rotate([0,0,180]) fixaVertical();

module fixaVertical(){
    difference(){
    rotate([90,0,0]) linear_extrude(height=6,center=true) polygon(points=[
        [0,0],
        [0,14],
        [6,14],
        [6,7]
        ]);
        translate([3,0,4]) cylinder(r=1,h=14,$fn=10);
    }
}
module exterior(){
//exterior
rotate([0,-90,0]) linear_extrude( height=100, center=true) polygon(points= [
                    [ 0,0],
                    [0,longoBase],
                    [10,longoBase+10],
                    [alto,longoBase+10],
                    [alto,alto/tan(inclinacion)]
                    ]
    );
}
//interior
module interior(thick){
     translate([0,-thick,thick]) rotate([0,-90,0]) linear_extrude( height=100-2*thick, center=true) polygon(points= [
                    [ 0,20],
                    [0,longoBase],
                    [10,longoBase+10],
                    [alto,longoBase+10],
                    [alto,alto/tan(inclinacion)],
                    [10,10]
                    ]
    );
}

module ocoRoda(){
    cube([anchoRoda+2,radioRoda*0.86*2+2,thick*3]);
}

module furados(){
   cube([anchoBrida,thickBrida,thick*6]);
   translate([0,10,0]) cube([anchoBrida,thickBrida,thick*6]); 
    translate([8,10,0]) cube([anchoBrida,thickBrida,thick*6]); 
    translate([8,0,0]) cube([anchoBrida,thickBrida,thick*6]); 
}