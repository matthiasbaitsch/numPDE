SetFactory("OpenCASCADE");

// create circular domain
Rectangle(1) = {0, 0, 0, 1,   1, 0};
Rectangle(2) = {1, 0, 0, 1,   1, 0};
Rectangle(3) = {2, 0, 0, 0.5, 1, 0};

// merge
Coherence;

// physical groups
Physical Surface("S1") = {1, 3};
Physical Surface("S2") = {2};
Physical Curve("Dirichlet Boundary") = {1, 3, 5, 7, 8, 10};

// create and save mesh 
MeshSize{:} = 0.1;
Mesh 2;
Save "multimaterial_model.msh";
