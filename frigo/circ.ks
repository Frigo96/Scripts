//Library for circularize functions.
parameter circAlt is ship:apoapsis.
local tgtAlt is 0.
local dptAlt is 0.
local nodeTime is eta:apoapsis.
local mu is body:mu.

//Set desired orbit altitude

if circAlt = "apo" or "apoapsis" {
    set nodeTime to eta:apoapsis.
    set tgtAlt to ship:apoapsis.
    set dptAlt to ship:periapsis.
}
if circAlt = "per" or "periapsis" {
    set nodeTime to eta:periapsis.
    set tgtAlt to ship:periapsis.
    set dptAlt to ship:apoapsis.
}

local nd is node(nodeTime,0,0,deltav(tgtAlt,dptAlt)).
add nd.

//Calculate deltaV burn vector.

function deltav {
    parameter r1. //target orbit
    parameter r2. //departure orbit

    return (sqrt(mu/r2)*(1-sqrt(2*r1/(r1+r2)))).
    }