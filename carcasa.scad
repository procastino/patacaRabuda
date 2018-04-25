longoBase=90;
alto=35;
inclinacion=30;
thick=2.5;
radioRoda=12;
anchoRoda=8;
anchoBrida=3;
thickBrida=1;

difference(){
exterior();
interior(3);
translate ([-50+2*thick,longoBase-radioRoda*2-4,0]) ocoRoda();
translate ([50-anchoRoda-2-2*thick,longoBase-radioRoda*2-4,0]) ocoRoda();
translate([-25,longoBase-radioRoda-10,-1]) furados();
    translate([12,longoBase-radioRoda-10,-1]) furados();
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
                    [ 0,0],
                    [0,longoBase],
                    [10,longoBase+10],
                    [alto,longoBase+10],
                    [alto,alto/tan(inclinacion)]
                    ]
    );
}

module ocoRoda(){
    cube([anchoRoda+2,radioRoda*0.86*2+2,thick*3]);
}

module furados(){
   cube([anchoBrida,thickBrida,thick*6]);
   translate([0,10,0]) cube([anchoBrida,thickBrida,thick*6]); 
    translate([10,10,0]) cube([anchoBrida,thickBrida,thick*6]); 
    translate([10,0,0]) cube([anchoBrida,thickBrida,thick*6]); 
}