#!/bin/sh

ethdcrminer64                                           \
    -dbg    -1                                          \
    -epsw   x                                           \
    -gpus   1                                           \
    -mode   1                                           \
    -pool   eth-us.sparkpool.com:3333                   \
    -tstart 70                                          \
    -tstop  85                                          \
    -wal    0x3aC14BF1f2C49b9A32Efb4b449420D9F3441AbcB  \
    -worker sagely

# -cclock -400                                        \
# -fanmin 100                                         \
# -mport  -3333                                       \
# -mclock +1100                                       \
# -powlim -15                                         \
# -tt     75                                          \
# -fret   1                                           \
