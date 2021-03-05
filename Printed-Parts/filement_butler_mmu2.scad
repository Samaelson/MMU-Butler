t=0.259;
tz=t+0.1;
pfte_tol = 0;//0.2;
th = 0.22; // ASA shrinking factor = 0


module ir_sensor(){
    translate([1.5,26,31.1])
    rotate([90,180,0])
    import("ir_sensor.stl");
}

module magnet_cyl(){
    cylinder(8.47,r=(4.88+t)/2,$fn=60);
    translate([0,0,-10])
    cylinder(28.47,r=(2+t)/2,$fn=60);
}

module holes(h=0){

    translate([0,11.25,-5])
    cylinder(30,r=(3.28)/2,$fn=64);

    translate([0,-11.75,-5])
    cylinder(30,r=(3.28)/2,$fn=64);

    translate([0,11.25,6])
    cylinder(30,r=(5.659)/2,$fn=64);

    translate([0,-11.75,6])
    cylinder(30,r=(5.6659)/2,$fn=64);

}

module endstop_top(){

    difference(){
        union(){
            translate([-19+25/2-8/2,55/2,15])
            cube([8,8,8]);

            translate([-19+25/2,55/2+8,15])
            cylinder(8,r=8/2,$fn=64);
        } // union end
        
        translate([-19+25/2,55/2+8-3,15-0.1])
        cylinder(8+0.2,r=(3.259)/2,$fn=64);

        translate([-19+25/2,55/2+8+1,15-0.1])
        cylinder(8+0.2,r=(3.259)/2,$fn=64);

        translate([-19+25/2-(3.259)/2,55/2+8-3,15-0.1])
        cube([3.259,3.259-0.2+1,8.2]);
    }// difference end    
    
}

module ir_jammer(){

    difference(){
        union(){
            translate([-12.75+0.4,15.5+1,9])
            cube([0.7,6-0.3-1.6,11]);

            translate([-12.75+2.5,15.5+1.6,8])
            rotate([0,0,90])
            cube([0.7,3.5,10]);    
        } // union end    

        translate([-12.75+0.3,15.5+1+3.6,8.8])
        rotate([-20,0,0])
        cube([0.9,6-0.3-1.6,11]);

        translate([-12.75+0.5+2.5,17.5-2+1-0.1,8-0.1])
        rotate([0,0,90])
        cube([1.5,3.5+3.1,2.6]);    
    } // difference end

}

module hinge(){
    translate([-19-0.59,-55/2-0.5,-2])
    cube([7+1.1,10+1,20]);

    translate([-1-1.1+0.59,-55/2-0.5,-2])
    cube([7+1.1,10+1,20]);

    // Gelenk
    translate([-19-0.59,-55/2+10/2,20-2])
    rotate([0,90,0])
    cylinder(7+1.1,r=(10+1)/2,$fn=64);

    translate([-1-1.1+0.59,-55/2+10/2,20-2])
    rotate([0,90,0])
    cylinder(7+1.1,r=(10+1)/2,$fn=64);

    // M3x25 screw cutout
    translate([-19,-55/2+10/2,20-2])
    rotate([0,90,0])
    cylinder(25,r=(3.259-0.1)/2,$fn=64);
}

module butler_bottom(){

difference(){
union(){
    difference()
    {
        union(){
            translate([-19,-55/2,0])
            cube([25,58,8]);

            translate([-19,-55/2+15-4,8])
            cube([14.5,33.5,3]);

        }

        translate([-9,8,3])
        magnet_cyl();

        translate([-9,-2,3])
        magnet_cyl();
        
        translate([-9,-12,3])
        magnet_cyl();

        translate([-15,12,3])
        magnet_cyl();

        translate([-15,3,3])
        magnet_cyl();

        translate([-15,-6,3])
        magnet_cyl();
        
        holes(7);

        translate([0,11.25,-0.1])
        cylinder(1.1,r1=(2.70+0.259+1)/2,r2=(2.70+0.259)/2,$fn=64);

        translate([0,-11.75,-0.1])
        cylinder(1.1,r1=(2.70+0.259+1)/2,r2=(2.70+0.259)/2,$fn=64);


        // filemant breakthrough cutout
        translate([0,0.25,0])
        {
            translate([0,0,-0.1])   
            cylinder(0.6,r1=(3.20+pfte_tol+0.5)/2, r2=(2.70+pfte_tol)/2,$fn=64);

            translate([0,0,0])
            cylinder(2,r=(2.70+pfte_tol)/2,$fn=64);

            translate([0,0,1.5]) 
            cylinder(0.5+0.1,r1=(2.70+pfte_tol)/2,r2=(3.50+pfte_tol)/2,$fn=64);    
        }
    } 
 
    difference()
    {
        translate([0,0.25,8])
        cylinder(5,r=(4.20+0.259+0.5+4+2)/2,$fn=64);


        // PFTE tube cutout
        translate([0,0.25,2])
        cylinder(30,r=(4.20+0.259+pfte_tol)/2,$fn=64);

        translate([0,-0.3,-0.5])
        cube([10,1,16]);
    }

    }
    translate([0,0.2,2.1])
    for(i=[0:3]){
    rotate([0,0,i*45])
    translate([-(4.459+pfte_tol+1.5)/2,-0.25,-0.1])
    cube([(4.459+pfte_tol+1.5),0.5,20]);
    }


    
    translate([0,0.2,2])
    cylinder(7.5,r1=(4.459+pfte_tol)/2+1, r2=(4.459+pfte_tol)/2-0.1,$fn=64);

    }

difference(){
    union(){
    // hinge
    translate([-19,-55/2,0])
    cube([7,10,20]);

    translate([-1,-55/2,0])
    cube([7,10,20]);

    // hinge
    translate([-19,-55/2+10/2,20])
    rotate([0,90,0])
    cylinder(7,r=10/2,$fn=64);

    translate([-1,-55/2+10/2,20])
    rotate([0,90,0])
    cylinder(7,r=10/2,$fn=64);
    }

    // M3x25 screw cutout
    translate([-19-0.1,-55/2+10/2,20])
    rotate([0,90,0])
    cylinder(3+0.1,r=(5.8)/2,$fn=64);

    translate([-19,-55/2+10/2,20])
    rotate([0,90,0])
    cylinder(25,r=(3.259)/2,$fn=64);

    translate([-19+25-6.25,-55/2+10/2,20])
    rotate([0,90,0])
    cylinder(6.25+0.1,r=(6.259)/2,$fn=6);
}


    // IR holder
    translate([0,0,-15])
    difference(){
        union(){
            translate([-19,55/2,15])
            cube([25,3,16.2]);

            translate([-8.7,55/2-1.5,15])
            cube([5,2,16.2]);

            translate([-8.7,55/2-1.5-5.5-0.25,15])
            cube([5,3.9,16.2]);

            translate([-19,55/2-1.5,15])
            cube([3.5,2,16.2]);

            translate([-1.4,55/2-1.5,15])
            cube([2.9,2,16.2]);
        }

        // screw part
        translate([-6,55/2-3,26.1+1])
        rotate([-90,0,0])
        cylinder(10,r=1.1+th,$fn=64);
        //head
        translate([-6,55/2-3+4,26.1+1])
        rotate([-90,0,0])
        cylinder(2.1,r=2.1+th,$fn=64);

        translate([-6,55/2-3-3.9-2,26.1+1])
        rotate([-90,0,0])
        cylinder(10,r=0.99,$fn=64);

    }

difference(){
union(){
        translate([-19+25/2-8/2,55/2-1.5,0])
        cube([8,8,8]);

        translate([-19+25/2,55/2+8-1.5,0])
        cylinder(8,r=8/2,$fn=64);
}
        translate([-19+25/2,55/2+8-1.5,-0.1])
        cylinder(8+0.2,r=(2.70+0.259)/2,$fn=64);

}

}



module butler_top(){

difference(){
    union(){
        difference(){

            union(){
                translate([-19,-55/2+5,15])
                cube([25,58-5,8]);
                
                endstop_top();
                    
                translate([-19,-55/2+15-4,12])
                cube([14.5,33.5,3]);
            
            }

            // Name and version
            translate([-15.7,23,22.5]) 
            rotate([0,0,0]) linear_extrude(height = 0.8) 
            { text("MMU2s",font = "helvetica:style=Bold", size=4, center=true); } 

            translate([-15.7,19,22.5]) 
            rotate([0,0,0]) linear_extrude(height = 0.8) 
            { text("Butler_V2",font = "helvetica:style=Bold", size=3, center=true); } 

            translate([-9,8,11.5])
            magnet_cyl();

            translate([-9,-2,11.5])
            magnet_cyl();
            
            translate([-9,-12,11.5])
            magnet_cyl();

            translate([-15,12,11.5])
            magnet_cyl();

            translate([-15,3,11.5])
            magnet_cyl();

            translate([-15,-6,11.5])
            magnet_cyl();
        
            translate([0,11.25,14])
            cylinder(30,r=(2.70+0.259)/2,$fn=64);

            translate([0,11.25,15+8-1])
            cylinder(1.1,r1=(2.70+0.259)/2,r2=(2.70+0.259+1)/2,$fn=64);

            translate([0,-11.75,14])
            cylinder(30,r=(2.70+0.259)/2,$fn=64);
            
            translate([0,-11.75,15+8-1])
            cylinder(1.1,r1=(2.70+0.259)/2,r2=(2.70+0.259+1)/2,$fn=64);

            translate([0,0.25,14-5])
            cylinder(35,r=(4.20+0.259+pfte_tol)/2,$fn=64);
            
            translate([0,0.25,15+7])
            cylinder(1.1,r1=(4.20+0.259+pfte_tol)/2,r2=(4.20+0.259+pfte_tol+1)/2,$fn=64);

        }

        translate([-19,-55/2+10/2,18])
        rotate([0,90,0])
        cylinder(25,r=10/2,$fn=64);
    }
    hinge();
}
    ir_jammer();
}



//-------------------------------------------------
// main
//-------------------------------------------------
/*
// filament
color("orange")
translate([0,0.25,-10]) rotate([0,0,0]) cylinder( h=120, r=1, $fn=30 );

// Prusa's infrared sensor
color("grey")
translate([0,0,-15])
ir_sensor();

color("orange")
translate([-4.9,1.805,0])
rotate([180,0,0])
import("selector-dual-bladestl.stl");


translate([0,0,2])
butler_top();
*/

butler_bottom();
