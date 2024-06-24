repo - https://github.com/joshlim01/VGA_Music_Player_RTOS \
youtube video - https://youtu.be/6r-ynVrTTC8?si=HEYBVH7sGUxDApkT

# VGA_Music_Player_RTOS
This is a music player and oscilloscope with a GUI that can be displayed on a VGA monitor.\
Digital design - Nios, Qsys, Direct Digital Synthesis, LFSR, Modulations, Clock Domains, MicroC OS-II RTOS

![VGA Monitor w/ Lab](https://github.com/joshlim01/VGA_Music_Player_RTOS/blob/main/doc/lab_monitor.jpg)
# SOF file location
/rtl/dds_and_nios_lab_time_limited.sof
# Lab status
### Task 1 ✔️
    Generating a 1 Hz clock from a clock divider for the LFSR
    
    Instantiating a 5-bit LFSR to give us a pseudo-random bit sequence

![Diagram of Task 1](https://github.com/joshlim01/VGA_Music_Player_RTOS/blob/main/doc/diagram/task_1_diagram.png)

### Task 2 ✔️
    Instantiating the DDS module

![Diagram of Task 2](https://github.com/joshlim01/VGA_Music_Player_RTOS/blob/main/doc/diagram/task_2_diagram.png)

### Task 3 ✔️
    Modulating the DDS using the LFSR using bit 0 of the LFSR

    Generating the ASK (OOS), BPSK, and LFSR signals with proper clock domain crossing
    
### Task 4 ✔️
    Connecting the signals to the VGA oscilloscope

### Task 5 ✔️
    Generating the FSK signal using PIOs in Qsys and Nios

### Task 6 ✔️
    Adding Nios PIOs, GUI buttons, and software to change the colors of the graphs upon command

### Task 7 ✔️
    Implementing the QPSK modulation and show it in the VGA oscilloscope

Read up more on QPSK here - https://www.ece.unb.ca/tervo/ece4253/qpsk.shtml

### Task 8 ✔️
    Enabling audio and adding 3 songs to the music player (use the wav2c.m script)

    Adding a 'PREV' and 'NEXT' button in the GUI to navigate between songs like a radio.

Tracklist:
1. Immortals - Fall Out Boy
2. Why’d You Only Call Me When You’re High? - Arctic Monkeys
3. Golden Brown - The Stranglers

# Important location
    - Signal Tap
    /rtl/stp1.stp
    - 5-bit LFSR
    /rtl/LFSR.sv
    - Fast-to-Slow Clock Crossing
    /rtl/fast_to_slow.sv
    - Slow-to_Fast Clock Crossing
    /rtl/slow_to_fast.sv
    - Interrupt Routine for LFSR clock
    /rtl/software/lab5/student_code/student_code.c
    - GUI Interface for VGA display
    /rtl/software/lab5/hello_ucosii.c
    - Songs for Music Player
    /rtl/software/lab5/songs/song.c
    /rtl/software/lab5/songs/song_ex_1.c
    /rtl/software/lab5/songs/song_ex_2.c

# Simulations

### 5-Bit LFSR
![LFSR](https://github.com/joshlim01/VGA_Music_Player_RTOS/blob/main/doc/lfsr_annotated_simulation.png)

### Fast-to-Slow Clock Crossing
![Fast-to-Slow](https://github.com/joshlim01/VGA_Music_Player_RTOS/blob/main/doc/fast_to_slow_annotated_simulation.png)

### Slow-to-Fast Clock Crossing
![Slow-to-Fast](https://github.com/joshlim01/VGA_Music_Player_RTOS/blob/main/doc/slow_to_fast_annotated_simulation.png)

# SignalTap (signal analyzer)

### DDS
![DDS](https://github.com/joshlim01/VGA_Music_Player_RTOS/blob/main/doc/dds_annotated_signaltap.png)

### Fast-to-Slow Clock Crossing
![Fast-to-Slow](https://github.com/joshlim01/VGA_Music_Player_RTOS/blob/main/doc/fast_to_slow_annotated_signaltap.png)