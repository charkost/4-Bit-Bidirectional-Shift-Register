vsim bidirectional_shifter

add wave clock
add wave input
add wave output
add wave sel
add wave serial_right
add wave serial_left
add wave reset

force clock 1 0, 0 {50 ns} -r 100
force input A
force serial_right 0
force serial_left 0
force sel 0
force reset 0

run 200

force sel 1

run 200

force sel 2

run 200

force sel 1
force serial_left 1

run 200

force sel 2
force serial_right 1

run 200

force sel 3

run 200

force reset 1 

run 200