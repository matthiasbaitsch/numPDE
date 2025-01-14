SetFactory("OpenCASCADE");

Disk(1) = {0, 0, 0, 2.2, 2.2};

MeshSize{:} = 0.2;
Mesh 2;
Save "heat-plate.msh";

