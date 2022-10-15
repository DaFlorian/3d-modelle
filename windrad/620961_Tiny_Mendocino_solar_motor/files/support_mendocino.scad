// Mendocino motor design by aeropic (c)2015


// all parameters here

r_magnet = 7;
e_magnet = 3.5; //magnet thickness 
ec_magnet = 37; // magnets distance


r_glass = 25; // glass radius
e_glass = 2.0; // glass thickness
r_tube = 1.75; //tube radius

wall_thickness = 1.01; // depends on the nozzle diameter (perfect for 0.5 nozzle)

// other parameters (don't change !)
$fa = 1;
$fs = 0.5;
delta_magnet_glass = 25; //distance between magnet and glass
e_base = 6;

module magnet() {
union(){
  difference() {
translate([0,0, 3/2*r_magnet - e_base/2  ]) sphere (r = r_magnet) ; 
translate([-e_magnet/2,0, 2*r_magnet - e_base/2 +2 ]) rotate([0,90,0])cylinder(r = r_magnet, h = e_magnet);
}
translate([0,0,1]) cylinder (r = r_magnet/2, h= e_base, center = true) ; 
}
}

module glass() {
  union(){
      difference() {
translate([0,0, 3/2*r_magnet - e_base/2  ]) sphere (r = r_magnet) ; 
translate([-e_glass/2,0, r_glass+r_magnet - e_base/2  ]) rotate([0,90,0])cylinder(r = r_glass, h = e_glass);

}
translate([0,0, 1  ]) cylinder (r = r_magnet/2, h= e_base, center = true) ; 
}
}

module support1() {
  difference() {
    union() {

translate([0,ec_magnet/2,0])	 magnet(); 
translate([0,-ec_magnet/2,0])	 magnet();
translate([0,0, 1  ]) cylinder (r = r_magnet/2, h= e_base, center = true) ; 
translate([0,0, 1  ]) cube ([wall_thickness,ec_magnet,e_base], center = true) ; 
}
translate([0,0, 1  ]) rotate([0,90,0]) cylinder (r = r_tube, h= 2*e_base, center = true) ; 

}}

module support2() {
  difference() {	
translate([delta_magnet_glass,0,0]) glass();
// on perce la boule
translate([0,0, 1  ])  rotate([0,90,0])cylinder (r = r_tube, h= 2*delta_magnet_glass +r_magnet/2, center = true) ; 


}}



// comment one of those two lines to print separately each support
support1();
support2();

