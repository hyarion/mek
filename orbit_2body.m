function [p,v,t] = orbit_2body(G,m,p0,v0,dt,tmax)

[p,v,t] = orbit_Nbody(G,m,p0,v0,dt,tmax);
