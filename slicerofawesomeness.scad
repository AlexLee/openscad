// rough draft for a slicer that can export to dxf
//based on work by Matthew Venn and clothbot

z_min=-7; // this was found by experimenting with different values
z_max=17;
slice_width=1; //need to add 1 to whatever your desired thickness is
layer=-7; //z_min<layer<z_max, using this instead of for loop for now because the for loop is so slow
//error at layer =15

module model() 
{
  		import("C:/Users/z003EE9Y/Downloads/stl_files/nozzle_0pcs00-cbg11-030-a04-master_hr.stl"); //need to figure out where stl is located
}


module slice_model() 
{
		for(layer = [z_min:slice_width+1:z_max]) //for (i= [start:step:end]
		{
	  		echo(str("Layer:", layer)); //print on console
				
			projection(cut=true) //project z=0 onto the xy plane
   		translate([0,0,layer])	//	move the part by z index
			model();	
 	
		//this is the hardpart
  		// sliceFileName="Model_name_layer."+layer+".dxf";
  		// export_dxf( sliceFileName, slice_model(index=layer);
		}
}

slice_model();
