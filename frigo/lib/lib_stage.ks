//This is a library for stage control and staging.

function stagingCheck {
    wait until stage:ready.
    if availableThrust=0 stage.
}