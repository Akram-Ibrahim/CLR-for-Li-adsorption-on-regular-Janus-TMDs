% This is a MATLAB calculator for obtaining the E_Li-TMD(bare) descriptor

% Instructions:
% ##############
% 1. Choose a TMD structure and a side of the TMD monolayer on top of which Li is to be adsorbed.
%    Note: Li can be on top of either the X or Y surfaces of a Janus TMD(MXY).
%    Note: Li on top of either side of a regular TMD (MX2) is the same. 
%    Based on your chosen configuration determine which layer is the top layer
%    (top layer is here defined as the layer the Li atom is adsorbed on, i.e., the layer closer the Li atom)
%    For example, Li on top of the S-side the Janus structure MXY=MoSTe will
%    make the X layer (S layer) the top layer and the Y layer (Te layer) the
%    bottom layer

clear
clc

keV     = 14.3996; % conversion constant to have energy(eV), charge(e), length(A)

% 2. From the provided file (data.xlsx), select the following:
%    - lattice: lattice constant of the TMD structure (from the 2nd column named 'Lattice')
%    - li: distance from Li ion to the top TMD layer (the layer it is going to get adsorbed on) 
%        Based on what layer (X or Y) is the top, read li from the 2rd or 4th columns named 'Li-X' and 'Li-Y')
%    - lup: distance from M(metal layer) to top chalcogen layer 
%    - ldown: distance from M(metal layer) to bottom chalcogen layer
%        (again based on what layer (X or Y) is the top choose lup and ldown from 'M-X distance' or 'M-Y distance' columns)

% Example:
% ##############
% Let's consider Li adsorption on the Te-side of the Janus structure MXY = MoSeTe
% This makes the Te layer (Y layer) the top layer
% Accordingly we choose the following values from the file (data.xlsx):

lattice = 3.43;       % lattice constant of the MoSeTe structure
li      = 2.04960;    % Li-Y distance 
lup     = 1.85965;    % M-Y distance
ldown   = 1.61116;    % M-X distance
cup     = -0.214775;  % charge on Y layer
cdown   = -0.416118;  % charge on X layer


% 3. Run
% ##############

dup     =  cup/(lattice^2*sqrt(3)/2);     % charge density on top layer
ddown   =  cdown/(lattice^2*sqrt(3)/2);   % charge density on bottom layer
dmiddle = -(ddown+dup);                   % charge density on middle layer


dimen   = 10000;  % define the number of grid points to consider in x and y directions
                  % separation in x and y is 1 angstrom between each two succesive grid points
                  % as this number is increased, the cuttoff radius of Li
                  % interaction with the TMD structure (in the plane of the TMD structure) is increased

dxy     = 1;      % dxy is the area of one square in the generated 2D grid in the x-y plane (angstrom^2)
                  %   since grid points spacing in both x and y is unity, 
                  %   the area of each square in the 2D grid is unity (1x1=1)

totale  = 0;
eup     = 0;
edown   = 0;

parfor x = -dimen/dxy:dimen/dxy  %iterate over the x-axis grid
    for y = -dimen/dxy:dimen/dxy %iterate over the y-axis grid
        eup    = dup*dxy^2/sqrt(li^2+(x*dxy)^2+(y*dxy)^2);
        emid   = dmiddle*dxy^2/sqrt((li+lup)^2+(x*dxy)^2+(y*dxy)^2);
        edown  = ddown*dxy^2/sqrt((li+lup+ldown)^2+(x*dxy)^2+(y*dxy)^2);
        totale = totale + eup + edown + emid;
    end
end
Energy = totale*keV % value of the E_Li-TMD(bare) descriptor





