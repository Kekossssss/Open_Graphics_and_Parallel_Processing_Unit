#import "@preview/glossarium:0.5.8": make-glossary, register-glossary, print-glossary, gls, glspl

= Introduction

The _#gls("OG-PPU")_ is intended as a #gls("DMA") accelerator dedicated at offloading parallel optimized workloads from the #gls("CPU"). This document is dedicated to explaining the hardware architecture of the accelerator. For informations on the instructions and programming of this accelerator, please refer to the _#gls("OG-PPU") : Programming Guide_ also available in this repository.\

The architecture takes inspiration from publicly available informations from the Nvidia architecture, the CUDA programming language and the #gls("RISC-V") #gls("ISA"). It aims at supporting multiple data formats and special operations for accelerating computes either for mass computation, or graphics rendering, either in 2D or 3D, with native image outputing capabilities.