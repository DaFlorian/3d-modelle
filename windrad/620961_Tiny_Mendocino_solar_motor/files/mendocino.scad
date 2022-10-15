// all parameters are here

length_SC = 30; //solar cell length
width_SC = 18.5; // solar cell width (add 1mm to real measure with next maram)
m = 1.1; // margin added to SC width
width_tooth= 5.5;
height_tooth = 4.5;
lip_tooth = 4;
th = 1.01; // wall thickness
rint = 1.75; // tube radius



// other parameters computations...
rext = rint+th;
wall = (width_SC+m+width_tooth/1.414)/1.414-height_tooth+th/1.414; 




module U()
{
//walls
translate([0,-th/2,0])cube([wall,th,length_SC]);

// le fond du U
translate([wall,-width_tooth/2,0]) cube([th,width_tooth,length_SC]);
//les barres du U
translate([wall,-width_tooth/2,0])cube([height_tooth,th,length_SC]);
translate([wall,width_tooth/2-th,0])cube([height_tooth,th,length_SC]);

// les glissières du SC
translate([wall - th + height_tooth,width_tooth/2-th,0])cube([th, lip_tooth,length_SC]);
translate([wall - th + height_tooth,-width_tooth/2+th-lip_tooth,0])cube([th,lip_tooth,length_SC]);

}

module SC()  // just needed for display
{
color( "blue", 1)translate([(wall+ 3*th  + height_tooth)/2,(wall + 3*th + height_tooth)/2,length_SC/2+2])rotate([0,0,135])cube([width_SC+m,1,length_SC], center = true);
}

module body()
{

difference() {
union ()
{
U();
//SC();   // uncomment to show the solar pannel
rotate([0,0,90]) U();
rotate([0,0,180]) U();
rotate([0,0,-90]) U();
cylinder(r=rext, h=length_SC,  $fn=50);

}
cylinder(r=rint, h=length_SC,  $fn=50);

}
}

body();