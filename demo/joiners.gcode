;E3P_GCODE_SPLIT: mold half separation applied after slicing
;E3P_GCODE_SPLIT_AXIS: X
;E3P_GCODE_SPLIT_COORD_MM: 40
;E3P_GCODE_SPLIT_GAP_MM: 4
;E3P_GCODE_SPLIT_START_LAYER: 0
;SYNTHETIC OFFLINE GEOMETRY FIXTURE - not a printer-ready job
G21
G90
M82
G92 E0
;LAYER:-1
G0 X18 Y18 Z0.2 F6000
G1 X62 Y18 E1.76000 F1200
G1 X62 Y42 E2.72000 F1200
G1 X18 Y42 E4.48000 F1200
G1 X18 Y18 E5.44000 F1200
;LAYER:0
G0 X18 Y20 Z0.4 F6000
G1 X38 Y20 E6.24 F1200 ;split half A
G1 E5.44 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X42 Y20 F1200 ;split gap travel
G0 Z0.4 F1200 ;split z-drop
G1 E6.24 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X62 Y20 E7.04 F1200 ;split half B
G1 X62 Y40 E7.84 F1200
G1 X42 Y40 E8.64 F1200 ;split half A
G1 E7.84 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X38 Y40 F1200 ;split gap travel
G0 Z0.4 F1200 ;split z-drop
G1 E8.64 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X18 Y40 E9.44 F1200 ;split half B
G1 X18 Y20 E10.24 F1200
G0 X18 Y22 F6000
G1 X38 Y22 E11.04 F1200 ;split half A
G1 E10.24 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X42 Y22 F1200 ;split gap travel
G0 Z0.4 F1200 ;split z-drop
G1 E11.04 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X62 Y22 E11.84 F1200 ;split half B
G0 X62 Y24 F6000
G1 X42 Y24 E12.64 F1200 ;split half A
G1 E11.84 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X38 Y24 F1200 ;split gap travel
G0 Z0.4 F1200 ;split z-drop
G1 E12.64 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X18 Y24 E13.44 F1200 ;split half B
G0 X18 Y26 F6000
G1 X38 Y26 E14.24 F1200 ;split half A
G1 E13.44 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X42 Y26 F1200 ;split gap travel
G0 Z0.4 F1200 ;split z-drop
G1 E14.24 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X62 Y26 E15.04 F1200 ;split half B
G0 X62 Y28 F6000
G1 X42 Y28 E15.84 F1200 ;split half A
G1 E15.04 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X38 Y28 F1200 ;split gap travel
G0 Z0.4 F1200 ;split z-drop
G1 E15.84 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X18 Y28 E16.64 F1200 ;split half B
G0 X18 Y30 F6000
G1 X38 Y30 E17.44 F1200 ;split half A
G1 E16.64 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X42 Y30 F1200 ;split gap travel
G0 Z0.4 F1200 ;split z-drop
G1 E17.44 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X62 Y30 E18.24 F1200 ;split half B
G0 X62 Y32 F6000
G1 X42 Y32 E19.04 F1200 ;split half A
G1 E18.24 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X38 Y32 F1200 ;split gap travel
G0 Z0.4 F1200 ;split z-drop
G1 E19.04 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X18 Y32 E19.84 F1200 ;split half B
G0 X18 Y34 F6000
G1 X38 Y34 E20.64 F1200 ;split half A
G1 E19.84 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X42 Y34 F1200 ;split gap travel
G0 Z0.4 F1200 ;split z-drop
G1 E20.64 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X62 Y34 E21.44 F1200 ;split half B
G0 X62 Y36 F6000
G1 X42 Y36 E22.24 F1200 ;split half A
G1 E21.44 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X38 Y36 F1200 ;split gap travel
G0 Z0.4 F1200 ;split z-drop
G1 E22.24 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X18 Y36 E23.04 F1200 ;split half B
G0 X18 Y38 F6000
G1 X38 Y38 E23.84 F1200 ;split half A
G1 E23.04 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X42 Y38 F1200 ;split gap travel
G0 Z0.4 F1200 ;split z-drop
G1 E23.84 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X62 Y38 E24.64 F1200 ;split half B
G1 E23.84 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X38 Y26 F1200 ;wire loop travel
G0 Z0.4 F1200 ;split z-drop
G1 E24.64 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X38 Y24 E24.72 F1200 ;wire loop
G1 X34 Y24 E24.88 F1200 ;wire loop
G1 X34 Y28 E25.04 F1200 ;wire loop
G1 X38 Y28 E25.2 F1200 ;wire loop
G1 X38 Y24 E25.36 F1200 ;wire loop
G1 E24.56 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X42 Y26 F1200 ;wire loop travel
G0 Z0.4 F1200 ;split z-drop
G1 E25.36 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X42 Y24.6 E25.416 F1200 ;outside peg
G1 X44.8 Y24.6 E25.528 F1200 ;outside peg
G1 X42 Y24.6 E25.64 F1200 ;outside peg
G1 X42 Y25.05 E25.658 F1200 ;outside peg
G1 X44.8 Y25.05 E25.77 F1200 ;outside peg
G1 X42 Y25.5 E25.88344 F1200 ;outside peg
G1 X44.8 Y25.5 E25.99544 F1200 ;outside peg
G1 X42 Y25.5 E26.10744 F1200 ;outside peg
G1 X42 Y25.95 E26.12544 F1200 ;outside peg
G1 X44.8 Y25.95 E26.23744 F1200 ;outside peg
G1 X42 Y26.4 E26.35087 F1200 ;outside peg
G1 X44.8 Y26.4 E26.46287 F1200 ;outside peg
G1 X42 Y26.4 E26.57487 F1200 ;outside peg
G1 X42 Y26.85 E26.59287 F1200 ;outside peg
G1 X44.8 Y26.85 E26.70487 F1200 ;outside peg
G1 X42 Y27.3 E26.81831 F1200 ;outside peg
G1 X44.8 Y27.3 E26.93031 F1200 ;outside peg
G1 X42 Y27.3 E27.04231 F1200 ;outside peg
G1 X42 Y27.4 E27.04631 F1200 ;outside peg
G1 X44.8 Y27.4 E27.15831 F1200 ;outside peg
G1 E26.35831 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X38 Y34 F1200 ;wire loop travel
G0 Z0.4 F1200 ;split z-drop
G1 E27.15831 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X38 Y32.6 E27.21431 F1200 ;outside peg
G1 X35.2 Y32.6 E27.32631 F1200 ;outside peg
G1 X38 Y32.6 E27.43831 F1200 ;outside peg
G1 X38 Y33.05 E27.45631 F1200 ;outside peg
G1 X35.2 Y33.05 E27.56831 F1200 ;outside peg
G1 X38 Y33.5 E27.68175 F1200 ;outside peg
G1 X35.2 Y33.5 E27.79375 F1200 ;outside peg
G1 X38 Y33.5 E27.90575 F1200 ;outside peg
G1 X38 Y33.95 E27.92375 F1200 ;outside peg
G1 X35.2 Y33.95 E28.03575 F1200 ;outside peg
G1 X38 Y34.4 E28.14919 F1200 ;outside peg
G1 X35.2 Y34.4 E28.26119 F1200 ;outside peg
G1 X38 Y34.4 E28.37319 F1200 ;outside peg
G1 X38 Y34.85 E28.39119 F1200 ;outside peg
G1 X35.2 Y34.85 E28.50319 F1200 ;outside peg
G1 X38 Y35.3 E28.61662 F1200 ;outside peg
G1 X35.2 Y35.3 E28.72862 F1200 ;outside peg
G1 X38 Y35.3 E28.84062 F1200 ;outside peg
G1 X38 Y35.4 E28.84462 F1200 ;outside peg
G1 X35.2 Y35.4 E28.95662 F1200 ;outside peg
G1 E28.15662 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X42 Y34 F1200 ;wire loop travel
G0 Z0.4 F1200 ;split z-drop
G1 E28.95662 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X42 Y32 E29.03662 F1200 ;wire loop
G1 X46 Y32 E29.19662 F1200 ;wire loop
G1 X46 Y36 E29.35662 F1200 ;wire loop
G1 X42 Y36 E29.51662 F1200 ;wire loop
G1 X42 Y32 E29.67662 F1200 ;wire loop
G1 E28.87662 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X62 Y38 F1200 ;wire loop return
G0 Z0.4 F1200 ;split z-drop
G1 E29.67662 F1800 ;split prime
G1 F1200 ;split restore feed
G92 E24.64 ;wire loop restore E
;LAYER:1
G1 E23.84 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X19.5 Y20 F6000 ;split gap travel
G0 Z0.6 F1200 ;split z-drop
G1 E24.64 F1800 ;split prime
G1 F6000 ;split restore feed
G1 X38 Y20 E25.38 F1200 ;split half A
G1 E24.58 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X42 Y20 F1200 ;split gap travel
G0 Z0.6 F1200 ;split z-drop
G1 E25.38 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X60.5 Y20 E26.12 F1200 ;split half B
G1 X60.5 Y40 E26.92 F1200
G1 X42 Y40 E27.66 F1200 ;split half A
G1 E26.86 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X38 Y40 F1200 ;split gap travel
G0 Z0.6 F1200 ;split z-drop
G1 E27.66 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X19.5 Y40 E28.4 F1200 ;split half B
G1 X19.5 Y20 E29.2 F1200
G0 X19.5 Y22 F6000
G1 X38 Y22 E29.94 F1200 ;split half A
G1 E29.14 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X42 Y22 F1200 ;split gap travel
G0 Z0.6 F1200 ;split z-drop
G1 E29.94 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X60.5 Y22 E30.68 F1200 ;split half B
G0 X60.5 Y24 F6000
G1 X42 Y24 E31.42 F1200 ;split half A
G1 E30.62 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X38 Y24 F1200 ;split gap travel
G0 Z0.6 F1200 ;split z-drop
G1 E31.42 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X19.5 Y24 E32.16 F1200 ;split half B
G0 X19.5 Y26 F6000
G1 X38 Y26 E32.9 F1200 ;split half A
G1 E32.1 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X42 Y26 F1200 ;split gap travel
G0 Z0.6 F1200 ;split z-drop
G1 E32.9 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X60.5 Y26 E33.64 F1200 ;split half B
G0 X60.5 Y28 F6000
G1 X42 Y28 E34.38 F1200 ;split half A
G1 E33.58 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X38 Y28 F1200 ;split gap travel
G0 Z0.6 F1200 ;split z-drop
G1 E34.38 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X19.5 Y28 E35.12 F1200 ;split half B
G0 X19.5 Y30 F6000
G1 X38 Y30 E35.86 F1200 ;split half A
G1 E35.06 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X42 Y30 F1200 ;split gap travel
G0 Z0.6 F1200 ;split z-drop
G1 E35.86 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X60.5 Y30 E36.6 F1200 ;split half B
G0 X60.5 Y32 F6000
G1 X42 Y32 E37.34 F1200 ;split half A
G1 E36.54 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X38 Y32 F1200 ;split gap travel
G0 Z0.6 F1200 ;split z-drop
G1 E37.34 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X19.5 Y32 E38.08 F1200 ;split half B
G0 X19.5 Y34 F6000
G1 X38 Y34 E38.82 F1200 ;split half A
G1 E38.02 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X42 Y34 F1200 ;split gap travel
G0 Z0.6 F1200 ;split z-drop
G1 E38.82 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X60.5 Y34 E39.56 F1200 ;split half B
G0 X60.5 Y36 F6000
G1 X42 Y36 E40.3 F1200 ;split half A
G1 E39.5 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X38 Y36 F1200 ;split gap travel
G0 Z0.6 F1200 ;split z-drop
G1 E40.3 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X19.5 Y36 E41.04 F1200 ;split half B
G0 X19.5 Y38 F6000
G1 X38 Y38 E41.78 F1200 ;split half A
G1 E40.98 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X42 Y38 F1200 ;split gap travel
G0 Z0.6 F1200 ;split z-drop
G1 E41.78 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X60.5 Y38 E42.52 F1200 ;split half B
G1 E41.72 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X38 Y26 F1200 ;wire loop travel
G0 Z0.6 F1200 ;split z-drop
G1 E42.52 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X38 Y24 E42.6 F1200 ;wire loop
G1 X34 Y24 E42.76 F1200 ;wire loop
G1 X34 Y28 E42.92 F1200 ;wire loop
G1 X38 Y28 E43.08 F1200 ;wire loop
G1 X38 Y24 E43.24 F1200 ;wire loop
G1 E42.44 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X42 Y26 F1200 ;wire loop travel
G0 Z0.6 F1200 ;split z-drop
G1 E43.24 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X42 Y24.6 E43.296 F1200 ;outside peg
G1 X44.8 Y24.6 E43.408 F1200 ;outside peg
G1 X42 Y24.6 E43.52 F1200 ;outside peg
G1 X42 Y25.05 E43.538 F1200 ;outside peg
G1 X44.8 Y25.05 E43.65 F1200 ;outside peg
G1 X42 Y25.5 E43.76344 F1200 ;outside peg
G1 X44.8 Y25.5 E43.87544 F1200 ;outside peg
G1 X42 Y25.5 E43.98744 F1200 ;outside peg
G1 X42 Y25.95 E44.00544 F1200 ;outside peg
G1 X44.8 Y25.95 E44.11744 F1200 ;outside peg
G1 X42 Y26.4 E44.23087 F1200 ;outside peg
G1 X44.8 Y26.4 E44.34287 F1200 ;outside peg
G1 X42 Y26.4 E44.45487 F1200 ;outside peg
G1 X42 Y26.85 E44.47287 F1200 ;outside peg
G1 X44.8 Y26.85 E44.58487 F1200 ;outside peg
G1 X42 Y27.3 E44.69831 F1200 ;outside peg
G1 X44.8 Y27.3 E44.81031 F1200 ;outside peg
G1 X42 Y27.3 E44.92231 F1200 ;outside peg
G1 X42 Y27.4 E44.92631 F1200 ;outside peg
G1 X44.8 Y27.4 E45.03831 F1200 ;outside peg
G1 E44.23831 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X38 Y34 F1200 ;wire loop travel
G0 Z0.6 F1200 ;split z-drop
G1 E45.03831 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X38 Y32.6 E45.09431 F1200 ;outside peg
G1 X35.2 Y32.6 E45.20631 F1200 ;outside peg
G1 X38 Y32.6 E45.31831 F1200 ;outside peg
G1 X38 Y33.05 E45.33631 F1200 ;outside peg
G1 X35.2 Y33.05 E45.44831 F1200 ;outside peg
G1 X38 Y33.5 E45.56175 F1200 ;outside peg
G1 X35.2 Y33.5 E45.67375 F1200 ;outside peg
G1 X38 Y33.5 E45.78575 F1200 ;outside peg
G1 X38 Y33.95 E45.80375 F1200 ;outside peg
G1 X35.2 Y33.95 E45.91575 F1200 ;outside peg
G1 X38 Y34.4 E46.02919 F1200 ;outside peg
G1 X35.2 Y34.4 E46.14119 F1200 ;outside peg
G1 X38 Y34.4 E46.25319 F1200 ;outside peg
G1 X38 Y34.85 E46.27119 F1200 ;outside peg
G1 X35.2 Y34.85 E46.38319 F1200 ;outside peg
G1 X38 Y35.3 E46.49662 F1200 ;outside peg
G1 X35.2 Y35.3 E46.60862 F1200 ;outside peg
G1 X38 Y35.3 E46.72062 F1200 ;outside peg
G1 X38 Y35.4 E46.72462 F1200 ;outside peg
G1 X35.2 Y35.4 E46.83662 F1200 ;outside peg
G1 E46.03662 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X42 Y34 F1200 ;wire loop travel
G0 Z0.6 F1200 ;split z-drop
G1 E46.83662 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X42 Y32 E46.91662 F1200 ;wire loop
G1 X46 Y32 E47.07662 F1200 ;wire loop
G1 X46 Y36 E47.23662 F1200 ;wire loop
G1 X42 Y36 E47.39662 F1200 ;wire loop
G1 X42 Y32 E47.55662 F1200 ;wire loop
G1 E46.75662 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X60.5 Y38 F1200 ;wire loop return
G0 Z0.6 F1200 ;split z-drop
G1 E47.55662 F1800 ;split prime
G1 F1200 ;split restore feed
G92 E42.52 ;wire loop restore E
;LAYER:2
G1 E41.72 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X21 Y20 F6000 ;split gap travel
G0 Z0.8 F1200 ;split z-drop
G1 E42.52 F1800 ;split prime
G1 F6000 ;split restore feed
G1 X38 Y20 E43.2 F1200 ;split half A
G1 E42.4 F1800 ;split retract
G0 Z1.4 F1200 ;split z-hop
G0 X42 Y20 F1200 ;split gap travel
G0 Z0.8 F1200 ;split z-drop
G1 E43.2 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X59 Y20 E43.88 F1200 ;split half B
G1 X59 Y40 E44.68 F1200
G1 X42 Y40 E45.36 F1200 ;split half A
G1 E44.56 F1800 ;split retract
G0 Z1.4 F1200 ;split z-hop
G0 X38 Y40 F1200 ;split gap travel
G0 Z0.8 F1200 ;split z-drop
G1 E45.36 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X21 Y40 E46.04 F1200 ;split half B
G1 X21 Y20 E46.84 F1200
G0 X21 Y22 F6000
G1 X38 Y22 E47.52 F1200 ;split half A
G1 E46.72 F1800 ;split retract
G0 Z1.4 F1200 ;split z-hop
G0 X42 Y22 F1200 ;split gap travel
G0 Z0.8 F1200 ;split z-drop
G1 E47.52 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X59 Y22 E48.2 F1200 ;split half B
G0 X59 Y24 F6000
G1 X42 Y24 E48.88 F1200 ;split half A
G1 E48.08 F1800 ;split retract
G0 Z1.4 F1200 ;split z-hop
G0 X38 Y24 F1200 ;split gap travel
G0 Z0.8 F1200 ;split z-drop
G1 E48.88 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X21 Y24 E49.56 F1200 ;split half B
G0 X21 Y26 F6000
G1 X38 Y26 E50.24 F1200 ;split half A
G1 E49.44 F1800 ;split retract
G0 Z1.4 F1200 ;split z-hop
G0 X42 Y26 F1200 ;split gap travel
G0 Z0.8 F1200 ;split z-drop
G1 E50.24 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X59 Y26 E50.92 F1200 ;split half B
G0 X59 Y28 F6000
G1 X42 Y28 E51.6 F1200 ;split half A
G1 E50.8 F1800 ;split retract
G0 Z1.4 F1200 ;split z-hop
G0 X38 Y28 F1200 ;split gap travel
G0 Z0.8 F1200 ;split z-drop
G1 E51.6 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X21 Y28 E52.28 F1200 ;split half B
G0 X21 Y30 F6000
G1 X38 Y30 E52.96 F1200 ;split half A
G1 E52.16 F1800 ;split retract
G0 Z1.4 F1200 ;split z-hop
G0 X42 Y30 F1200 ;split gap travel
G0 Z0.8 F1200 ;split z-drop
G1 E52.96 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X59 Y30 E53.64 F1200 ;split half B
G0 X59 Y32 F6000
G1 X42 Y32 E54.32 F1200 ;split half A
G1 E53.52 F1800 ;split retract
G0 Z1.4 F1200 ;split z-hop
G0 X38 Y32 F1200 ;split gap travel
G0 Z0.8 F1200 ;split z-drop
G1 E54.32 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X21 Y32 E55 F1200 ;split half B
G0 X21 Y34 F6000
G1 X38 Y34 E55.68 F1200 ;split half A
G1 E54.88 F1800 ;split retract
G0 Z1.4 F1200 ;split z-hop
G0 X42 Y34 F1200 ;split gap travel
G0 Z0.8 F1200 ;split z-drop
G1 E55.68 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X59 Y34 E56.36 F1200 ;split half B
G0 X59 Y36 F6000
G1 X42 Y36 E57.04 F1200 ;split half A
G1 E56.24 F1800 ;split retract
G0 Z1.4 F1200 ;split z-hop
G0 X38 Y36 F1200 ;split gap travel
G0 Z0.8 F1200 ;split z-drop
G1 E57.04 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X21 Y36 E57.72 F1200 ;split half B
G0 X21 Y38 F6000
G1 X38 Y38 E58.4 F1200 ;split half A
G1 E57.6 F1800 ;split retract
G0 Z1.4 F1200 ;split z-hop
G0 X42 Y38 F1200 ;split gap travel
G0 Z0.8 F1200 ;split z-drop
G1 E58.4 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X59 Y38 E59.08 F1200 ;split half B
G1 E58.28 F1800 ;split retract
G0 Z1.4 F1200 ;split z-hop
G0 X38 Y26 F1200 ;wire loop travel
G0 Z0.8 F1200 ;split z-drop
G1 E59.08 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X38 Y24 E59.16 F1200 ;wire loop
G1 X34 Y24 E59.32 F1200 ;wire loop
G1 X34 Y28 E59.48 F1200 ;wire loop
G1 X38 Y28 E59.64 F1200 ;wire loop
G1 X38 Y24 E59.8 F1200 ;wire loop
G1 E59 F1800 ;split retract
G0 Z1.4 F1200 ;split z-hop
G0 X42 Y26 F1200 ;wire loop travel
G0 Z0.8 F1200 ;split z-drop
G1 E59.8 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X42 Y24.6 E59.856 F1200 ;outside peg
G1 X44.8 Y24.6 E59.968 F1200 ;outside peg
G1 X42 Y24.6 E60.08 F1200 ;outside peg
G1 X42 Y25.05 E60.098 F1200 ;outside peg
G1 X44.8 Y25.05 E60.21 F1200 ;outside peg
G1 X42 Y25.5 E60.32344 F1200 ;outside peg
G1 X44.8 Y25.5 E60.43544 F1200 ;outside peg
G1 X42 Y25.5 E60.54744 F1200 ;outside peg
G1 X42 Y25.95 E60.56544 F1200 ;outside peg
G1 X44.8 Y25.95 E60.67744 F1200 ;outside peg
G1 X42 Y26.4 E60.79087 F1200 ;outside peg
G1 X44.8 Y26.4 E60.90287 F1200 ;outside peg
G1 X42 Y26.4 E61.01487 F1200 ;outside peg
G1 X42 Y26.85 E61.03287 F1200 ;outside peg
G1 X44.8 Y26.85 E61.14487 F1200 ;outside peg
G1 X42 Y27.3 E61.25831 F1200 ;outside peg
G1 X44.8 Y27.3 E61.37031 F1200 ;outside peg
G1 X42 Y27.3 E61.48231 F1200 ;outside peg
G1 X42 Y27.4 E61.48631 F1200 ;outside peg
G1 X44.8 Y27.4 E61.59831 F1200 ;outside peg
G1 E60.79831 F1800 ;split retract
G0 Z1.4 F1200 ;split z-hop
G0 X38 Y34 F1200 ;wire loop travel
G0 Z0.8 F1200 ;split z-drop
G1 E61.59831 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X38 Y32.6 E61.65431 F1200 ;outside peg
G1 X35.2 Y32.6 E61.76631 F1200 ;outside peg
G1 X38 Y32.6 E61.87831 F1200 ;outside peg
G1 X38 Y33.05 E61.89631 F1200 ;outside peg
G1 X35.2 Y33.05 E62.00831 F1200 ;outside peg
G1 X38 Y33.5 E62.12175 F1200 ;outside peg
G1 X35.2 Y33.5 E62.23375 F1200 ;outside peg
G1 X38 Y33.5 E62.34575 F1200 ;outside peg
G1 X38 Y33.95 E62.36375 F1200 ;outside peg
G1 X35.2 Y33.95 E62.47575 F1200 ;outside peg
G1 X38 Y34.4 E62.58919 F1200 ;outside peg
G1 X35.2 Y34.4 E62.70119 F1200 ;outside peg
G1 X38 Y34.4 E62.81319 F1200 ;outside peg
G1 X38 Y34.85 E62.83119 F1200 ;outside peg
G1 X35.2 Y34.85 E62.94319 F1200 ;outside peg
G1 X38 Y35.3 E63.05662 F1200 ;outside peg
G1 X35.2 Y35.3 E63.16862 F1200 ;outside peg
G1 X38 Y35.3 E63.28062 F1200 ;outside peg
G1 X38 Y35.4 E63.28462 F1200 ;outside peg
G1 X35.2 Y35.4 E63.39662 F1200 ;outside peg
G1 E62.59662 F1800 ;split retract
G0 Z1.4 F1200 ;split z-hop
G0 X42 Y34 F1200 ;wire loop travel
G0 Z0.8 F1200 ;split z-drop
G1 E63.39662 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X42 Y32 E63.47662 F1200 ;wire loop
G1 X46 Y32 E63.63662 F1200 ;wire loop
G1 X46 Y36 E63.79662 F1200 ;wire loop
G1 X42 Y36 E63.95662 F1200 ;wire loop
G1 X42 Y32 E64.11662 F1200 ;wire loop
G1 E63.31662 F1800 ;split retract
G0 Z1.4 F1200 ;split z-hop
G0 X59 Y38 F1200 ;wire loop return
G0 Z0.8 F1200 ;split z-drop
G1 E64.11662 F1800 ;split prime
G1 F1200 ;split restore feed
G92 E59.08 ;wire loop restore E
;LAYER:3
G1 E58.28 F1800 ;split retract
G0 Z1.4 F1200 ;split z-hop
G0 X22.5 Y20 F6000 ;split gap travel
G0 Z1 F1200 ;split z-drop
G1 E59.08 F1800 ;split prime
G1 F6000 ;split restore feed
G1 X38 Y20 E59.7 F1200 ;split half A
G1 E58.9 F1800 ;split retract
G0 Z1.6 F1200 ;split z-hop
G0 X42 Y20 F1200 ;split gap travel
G0 Z1 F1200 ;split z-drop
G1 E59.7 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X57.5 Y20 E60.32 F1200 ;split half B
G1 X57.5 Y40 E61.12 F1200
G1 X42 Y40 E61.74 F1200 ;split half A
G1 E60.94 F1800 ;split retract
G0 Z1.6 F1200 ;split z-hop
G0 X38 Y40 F1200 ;split gap travel
G0 Z1 F1200 ;split z-drop
G1 E61.74 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X22.5 Y40 E62.36 F1200 ;split half B
G1 X22.5 Y20 E63.16 F1200
G0 X22.5 Y22 F6000
G1 X38 Y22 E63.78 F1200 ;split half A
G1 E62.98 F1800 ;split retract
G0 Z1.6 F1200 ;split z-hop
G0 X42 Y22 F1200 ;split gap travel
G0 Z1 F1200 ;split z-drop
G1 E63.78 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X57.5 Y22 E64.4 F1200 ;split half B
G0 X57.5 Y24 F6000
G1 X42 Y24 E65.02 F1200 ;split half A
G1 E64.22 F1800 ;split retract
G0 Z1.6 F1200 ;split z-hop
G0 X38 Y24 F1200 ;split gap travel
G0 Z1 F1200 ;split z-drop
G1 E65.02 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X22.5 Y24 E65.64 F1200 ;split half B
G0 X22.5 Y26 F6000
G1 X38 Y26 E66.26 F1200 ;split half A
G1 E65.46 F1800 ;split retract
G0 Z1.6 F1200 ;split z-hop
G0 X42 Y26 F1200 ;split gap travel
G0 Z1 F1200 ;split z-drop
G1 E66.26 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X57.5 Y26 E66.88 F1200 ;split half B
G0 X57.5 Y28 F6000
G1 X42 Y28 E67.5 F1200 ;split half A
G1 E66.7 F1800 ;split retract
G0 Z1.6 F1200 ;split z-hop
G0 X38 Y28 F1200 ;split gap travel
G0 Z1 F1200 ;split z-drop
G1 E67.5 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X22.5 Y28 E68.12 F1200 ;split half B
G0 X22.5 Y30 F6000
G1 X38 Y30 E68.74 F1200 ;split half A
G1 E67.94 F1800 ;split retract
G0 Z1.6 F1200 ;split z-hop
G0 X42 Y30 F1200 ;split gap travel
G0 Z1 F1200 ;split z-drop
G1 E68.74 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X57.5 Y30 E69.36 F1200 ;split half B
G0 X57.5 Y32 F6000
G1 X42 Y32 E69.98 F1200 ;split half A
G1 E69.18 F1800 ;split retract
G0 Z1.6 F1200 ;split z-hop
G0 X38 Y32 F1200 ;split gap travel
G0 Z1 F1200 ;split z-drop
G1 E69.98 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X22.5 Y32 E70.6 F1200 ;split half B
G0 X22.5 Y34 F6000
G1 X38 Y34 E71.22 F1200 ;split half A
G1 E70.42 F1800 ;split retract
G0 Z1.6 F1200 ;split z-hop
G0 X42 Y34 F1200 ;split gap travel
G0 Z1 F1200 ;split z-drop
G1 E71.22 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X57.5 Y34 E71.84 F1200 ;split half B
G0 X57.5 Y36 F6000
G1 X42 Y36 E72.46 F1200 ;split half A
G1 E71.66 F1800 ;split retract
G0 Z1.6 F1200 ;split z-hop
G0 X38 Y36 F1200 ;split gap travel
G0 Z1 F1200 ;split z-drop
G1 E72.46 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X22.5 Y36 E73.08 F1200 ;split half B
G0 X22.5 Y38 F6000
G1 X38 Y38 E73.7 F1200 ;split half A
G1 E72.9 F1800 ;split retract
G0 Z1.6 F1200 ;split z-hop
G0 X42 Y38 F1200 ;split gap travel
G0 Z1 F1200 ;split z-drop
G1 E73.7 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X57.5 Y38 E74.32 F1200 ;split half B
G1 E73.52 F1800 ;split retract
G0 Z1.6 F1200 ;split z-hop
G0 X38 Y26 F1200 ;wire loop travel
G0 Z1 F1200 ;split z-drop
G1 E74.32 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X38 Y24 E74.4 F1200 ;wire loop
G1 X34 Y24 E74.56 F1200 ;wire loop
G1 X34 Y28 E74.72 F1200 ;wire loop
G1 X38 Y28 E74.88 F1200 ;wire loop
G1 X38 Y24 E75.04 F1200 ;wire loop
G1 E74.24 F1800 ;split retract
G0 Z1.6 F1200 ;split z-hop
G0 X42 Y26 F1200 ;wire loop travel
G0 Z1 F1200 ;split z-drop
G1 E75.04 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X42 Y24.6 E75.096 F1200 ;outside peg
G1 X44.8 Y24.6 E75.208 F1200 ;outside peg
G1 X42 Y24.6 E75.32 F1200 ;outside peg
G1 X42 Y25.05 E75.338 F1200 ;outside peg
G1 X44.8 Y25.05 E75.45 F1200 ;outside peg
G1 X42 Y25.5 E75.56344 F1200 ;outside peg
G1 X44.8 Y25.5 E75.67544 F1200 ;outside peg
G1 X42 Y25.5 E75.78744 F1200 ;outside peg
G1 X42 Y25.95 E75.80544 F1200 ;outside peg
G1 X44.8 Y25.95 E75.91744 F1200 ;outside peg
G1 X42 Y26.4 E76.03087 F1200 ;outside peg
G1 X44.8 Y26.4 E76.14287 F1200 ;outside peg
G1 X42 Y26.4 E76.25487 F1200 ;outside peg
G1 X42 Y26.85 E76.27287 F1200 ;outside peg
G1 X44.8 Y26.85 E76.38487 F1200 ;outside peg
G1 X42 Y27.3 E76.49831 F1200 ;outside peg
G1 X44.8 Y27.3 E76.61031 F1200 ;outside peg
G1 X42 Y27.3 E76.72231 F1200 ;outside peg
G1 X42 Y27.4 E76.72631 F1200 ;outside peg
G1 X44.8 Y27.4 E76.83831 F1200 ;outside peg
G1 E76.03831 F1800 ;split retract
G0 Z1.6 F1200 ;split z-hop
G0 X38 Y34 F1200 ;wire loop travel
G0 Z1 F1200 ;split z-drop
G1 E76.83831 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X38 Y32.6 E76.89431 F1200 ;outside peg
G1 X35.2 Y32.6 E77.00631 F1200 ;outside peg
G1 X38 Y32.6 E77.11831 F1200 ;outside peg
G1 X38 Y33.05 E77.13631 F1200 ;outside peg
G1 X35.2 Y33.05 E77.24831 F1200 ;outside peg
G1 X38 Y33.5 E77.36175 F1200 ;outside peg
G1 X35.2 Y33.5 E77.47375 F1200 ;outside peg
G1 X38 Y33.5 E77.58575 F1200 ;outside peg
G1 X38 Y33.95 E77.60375 F1200 ;outside peg
G1 X35.2 Y33.95 E77.71575 F1200 ;outside peg
G1 X38 Y34.4 E77.82919 F1200 ;outside peg
G1 X35.2 Y34.4 E77.94119 F1200 ;outside peg
G1 X38 Y34.4 E78.05319 F1200 ;outside peg
G1 X38 Y34.85 E78.07119 F1200 ;outside peg
G1 X35.2 Y34.85 E78.18319 F1200 ;outside peg
G1 X38 Y35.3 E78.29662 F1200 ;outside peg
G1 X35.2 Y35.3 E78.40862 F1200 ;outside peg
G1 X38 Y35.3 E78.52062 F1200 ;outside peg
G1 X38 Y35.4 E78.52462 F1200 ;outside peg
G1 X35.2 Y35.4 E78.63662 F1200 ;outside peg
G1 E77.83662 F1800 ;split retract
G0 Z1.6 F1200 ;split z-hop
G0 X42 Y34 F1200 ;wire loop travel
G0 Z1 F1200 ;split z-drop
G1 E78.63662 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X42 Y32 E78.71662 F1200 ;wire loop
G1 X46 Y32 E78.87662 F1200 ;wire loop
G1 X46 Y36 E79.03662 F1200 ;wire loop
G1 X42 Y36 E79.19662 F1200 ;wire loop
G1 X42 Y32 E79.35662 F1200 ;wire loop
G1 E78.55662 F1800 ;split retract
G0 Z1.6 F1200 ;split z-hop
G0 X57.5 Y38 F1200 ;wire loop return
G0 Z1 F1200 ;split z-drop
G1 E79.35662 F1800 ;split prime
G1 F1200 ;split restore feed
G92 E74.32 ;wire loop restore E
;LAYER:4
G1 E73.52 F1800 ;split retract
G0 Z1.6 F1200 ;split z-hop
G0 X24 Y20 F6000 ;split gap travel
G0 Z1.2 F1200 ;split z-drop
G1 E74.32 F1800 ;split prime
G1 F6000 ;split restore feed
G1 X38 Y20 E74.88 F1200 ;split half A
G1 E74.08 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X42 Y20 F1200 ;split gap travel
G0 Z1.2 F1200 ;split z-drop
G1 E74.88 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X56 Y20 E75.44 F1200 ;split half B
G1 X56 Y40 E76.24 F1200
G1 X42 Y40 E76.8 F1200 ;split half A
G1 E76 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X38 Y40 F1200 ;split gap travel
G0 Z1.2 F1200 ;split z-drop
G1 E76.8 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X24 Y40 E77.36 F1200 ;split half B
G1 X24 Y20 E78.16 F1200
G0 X24 Y22 F6000
G1 X38 Y22 E78.72 F1200 ;split half A
G1 E77.92 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X42 Y22 F1200 ;split gap travel
G0 Z1.2 F1200 ;split z-drop
G1 E78.72 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X56 Y22 E79.28 F1200 ;split half B
G0 X56 Y24 F6000
G1 X42 Y24 E79.84 F1200 ;split half A
G1 E79.04 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X38 Y24 F1200 ;split gap travel
G0 Z1.2 F1200 ;split z-drop
G1 E79.84 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X24 Y24 E80.4 F1200 ;split half B
G0 X24 Y26 F6000
G1 X38 Y26 E80.96 F1200 ;split half A
G1 E80.16 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X42 Y26 F1200 ;split gap travel
G0 Z1.2 F1200 ;split z-drop
G1 E80.96 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X56 Y26 E81.52 F1200 ;split half B
G0 X56 Y28 F6000
G1 X42 Y28 E82.08 F1200 ;split half A
G1 E81.28 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X38 Y28 F1200 ;split gap travel
G0 Z1.2 F1200 ;split z-drop
G1 E82.08 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X24 Y28 E82.64 F1200 ;split half B
G0 X24 Y30 F6000
G1 X38 Y30 E83.2 F1200 ;split half A
G1 E82.4 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X42 Y30 F1200 ;split gap travel
G0 Z1.2 F1200 ;split z-drop
G1 E83.2 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X56 Y30 E83.76 F1200 ;split half B
G0 X56 Y32 F6000
G1 X42 Y32 E84.32 F1200 ;split half A
G1 E83.52 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X38 Y32 F1200 ;split gap travel
G0 Z1.2 F1200 ;split z-drop
G1 E84.32 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X24 Y32 E84.88 F1200 ;split half B
G0 X24 Y34 F6000
G1 X38 Y34 E85.44 F1200 ;split half A
G1 E84.64 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X42 Y34 F1200 ;split gap travel
G0 Z1.2 F1200 ;split z-drop
G1 E85.44 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X56 Y34 E86 F1200 ;split half B
G0 X56 Y36 F6000
G1 X42 Y36 E86.56 F1200 ;split half A
G1 E85.76 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X38 Y36 F1200 ;split gap travel
G0 Z1.2 F1200 ;split z-drop
G1 E86.56 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X24 Y36 E87.12 F1200 ;split half B
G0 X24 Y38 F6000
G1 X38 Y38 E87.68 F1200 ;split half A
G1 E86.88 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X42 Y38 F1200 ;split gap travel
G0 Z1.2 F1200 ;split z-drop
G1 E87.68 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X56 Y38 E88.24 F1200 ;split half B
G1 E87.44 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X38 Y26 F1200 ;wire loop travel
G0 Z1.2 F1200 ;split z-drop
G1 E88.24 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X38 Y24 E88.32 F1200 ;wire loop
G1 X34 Y24 E88.48 F1200 ;wire loop
G1 X34 Y28 E88.64 F1200 ;wire loop
G1 X38 Y28 E88.8 F1200 ;wire loop
G1 X38 Y24 E88.96 F1200 ;wire loop
G1 E88.16 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X42 Y26 F1200 ;wire loop travel
G0 Z1.2 F1200 ;split z-drop
G1 E88.96 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X42 Y24.6 E89.016 F1200 ;outside peg
G1 X44.8 Y24.6 E89.128 F1200 ;outside peg
G1 X42 Y24.6 E89.24 F1200 ;outside peg
G1 X42 Y25.05 E89.258 F1200 ;outside peg
G1 X44.8 Y25.05 E89.37 F1200 ;outside peg
G1 X42 Y25.5 E89.48344 F1200 ;outside peg
G1 X44.8 Y25.5 E89.59544 F1200 ;outside peg
G1 X42 Y25.5 E89.70744 F1200 ;outside peg
G1 X42 Y25.95 E89.72544 F1200 ;outside peg
G1 X44.8 Y25.95 E89.83744 F1200 ;outside peg
G1 X42 Y26.4 E89.95087 F1200 ;outside peg
G1 X44.8 Y26.4 E90.06287 F1200 ;outside peg
G1 X42 Y26.4 E90.17487 F1200 ;outside peg
G1 X42 Y26.85 E90.19287 F1200 ;outside peg
G1 X44.8 Y26.85 E90.30487 F1200 ;outside peg
G1 X42 Y27.3 E90.41831 F1200 ;outside peg
G1 X44.8 Y27.3 E90.53031 F1200 ;outside peg
G1 X42 Y27.3 E90.64231 F1200 ;outside peg
G1 X42 Y27.4 E90.64631 F1200 ;outside peg
G1 X44.8 Y27.4 E90.75831 F1200 ;outside peg
G1 E89.95831 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X38 Y34 F1200 ;wire loop travel
G0 Z1.2 F1200 ;split z-drop
G1 E90.75831 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X38 Y32.6 E90.81431 F1200 ;outside peg
G1 X35.2 Y32.6 E90.92631 F1200 ;outside peg
G1 X38 Y32.6 E91.03831 F1200 ;outside peg
G1 X38 Y33.05 E91.05631 F1200 ;outside peg
G1 X35.2 Y33.05 E91.16831 F1200 ;outside peg
G1 X38 Y33.5 E91.28175 F1200 ;outside peg
G1 X35.2 Y33.5 E91.39375 F1200 ;outside peg
G1 X38 Y33.5 E91.50575 F1200 ;outside peg
G1 X38 Y33.95 E91.52375 F1200 ;outside peg
G1 X35.2 Y33.95 E91.63575 F1200 ;outside peg
G1 X38 Y34.4 E91.74919 F1200 ;outside peg
G1 X35.2 Y34.4 E91.86119 F1200 ;outside peg
G1 X38 Y34.4 E91.97319 F1200 ;outside peg
G1 X38 Y34.85 E91.99119 F1200 ;outside peg
G1 X35.2 Y34.85 E92.10319 F1200 ;outside peg
G1 X38 Y35.3 E92.21662 F1200 ;outside peg
G1 X35.2 Y35.3 E92.32862 F1200 ;outside peg
G1 X38 Y35.3 E92.44062 F1200 ;outside peg
G1 X38 Y35.4 E92.44462 F1200 ;outside peg
G1 X35.2 Y35.4 E92.55662 F1200 ;outside peg
G1 E91.75662 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X42 Y34 F1200 ;wire loop travel
G0 Z1.2 F1200 ;split z-drop
G1 E92.55662 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X42 Y32 E92.63662 F1200 ;wire loop
G1 X46 Y32 E92.79662 F1200 ;wire loop
G1 X46 Y36 E92.95662 F1200 ;wire loop
G1 X42 Y36 E93.11662 F1200 ;wire loop
G1 X42 Y32 E93.27662 F1200 ;wire loop
G1 E92.47662 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X56 Y38 F1200 ;wire loop return
G0 Z1.2 F1200 ;split z-drop
G1 E93.27662 F1800 ;split prime
G1 F1200 ;split restore feed
G92 E88.24 ;wire loop restore E
;LAYER:5
G1 E87.44 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X25.5 Y20 F6000 ;split gap travel
G0 Z1.4 F1200 ;split z-drop
G1 E88.24 F1800 ;split prime
G1 F6000 ;split restore feed
G1 X38 Y20 E88.74 F1200 ;split half A
G1 E87.94 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X42 Y20 F1200 ;split gap travel
G0 Z1.4 F1200 ;split z-drop
G1 E88.74 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X54.5 Y20 E89.24 F1200 ;split half B
G1 X54.5 Y40 E90.04 F1200
G1 X42 Y40 E90.54 F1200 ;split half A
G1 E89.74 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X38 Y40 F1200 ;split gap travel
G0 Z1.4 F1200 ;split z-drop
G1 E90.54 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X25.5 Y40 E91.04 F1200 ;split half B
G1 X25.5 Y20 E91.84 F1200
G0 X25.5 Y22 F6000
G1 X38 Y22 E92.34 F1200 ;split half A
G1 E91.54 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X42 Y22 F1200 ;split gap travel
G0 Z1.4 F1200 ;split z-drop
G1 E92.34 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X54.5 Y22 E92.84 F1200 ;split half B
G0 X54.5 Y24 F6000
G1 X42 Y24 E93.34 F1200 ;split half A
G1 E92.54 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X38 Y24 F1200 ;split gap travel
G0 Z1.4 F1200 ;split z-drop
G1 E93.34 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X25.5 Y24 E93.84 F1200 ;split half B
G0 X25.5 Y26 F6000
G1 X38 Y26 E94.34 F1200 ;split half A
G1 E93.54 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X42 Y26 F1200 ;split gap travel
G0 Z1.4 F1200 ;split z-drop
G1 E94.34 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X54.5 Y26 E94.84 F1200 ;split half B
G0 X54.5 Y28 F6000
G1 X42 Y28 E95.34 F1200 ;split half A
G1 E94.54 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X38 Y28 F1200 ;split gap travel
G0 Z1.4 F1200 ;split z-drop
G1 E95.34 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X25.5 Y28 E95.84 F1200 ;split half B
G0 X25.5 Y30 F6000
G1 X38 Y30 E96.34 F1200 ;split half A
G1 E95.54 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X42 Y30 F1200 ;split gap travel
G0 Z1.4 F1200 ;split z-drop
G1 E96.34 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X54.5 Y30 E96.84 F1200 ;split half B
G0 X54.5 Y32 F6000
G1 X42 Y32 E97.34 F1200 ;split half A
G1 E96.54 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X38 Y32 F1200 ;split gap travel
G0 Z1.4 F1200 ;split z-drop
G1 E97.34 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X25.5 Y32 E97.84 F1200 ;split half B
G0 X25.5 Y34 F6000
G1 X38 Y34 E98.34 F1200 ;split half A
G1 E97.54 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X42 Y34 F1200 ;split gap travel
G0 Z1.4 F1200 ;split z-drop
G1 E98.34 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X54.5 Y34 E98.84 F1200 ;split half B
G0 X54.5 Y36 F6000
G1 X42 Y36 E99.34 F1200 ;split half A
G1 E98.54 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X38 Y36 F1200 ;split gap travel
G0 Z1.4 F1200 ;split z-drop
G1 E99.34 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X25.5 Y36 E99.84 F1200 ;split half B
G0 X25.5 Y38 F6000
G1 X38 Y38 E100.34 F1200 ;split half A
G1 E99.54 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X42 Y38 F1200 ;split gap travel
G0 Z1.4 F1200 ;split z-drop
G1 E100.34 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X54.5 Y38 E100.84 F1200 ;split half B
G1 E100.04 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X38 Y26 F1200 ;wire loop travel
G0 Z1.4 F1200 ;split z-drop
G1 E100.84 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X38 Y24 E100.92 F1200 ;wire loop
G1 X34 Y24 E101.08 F1200 ;wire loop
G1 X34 Y28 E101.24 F1200 ;wire loop
G1 X38 Y28 E101.4 F1200 ;wire loop
G1 X38 Y24 E101.56 F1200 ;wire loop
G1 E100.76 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X42 Y26 F1200 ;wire loop travel
G0 Z1.4 F1200 ;split z-drop
G1 E101.56 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X42 Y24.6 E101.616 F1200 ;outside peg
G1 X44.8 Y24.6 E101.728 F1200 ;outside peg
G1 X42 Y24.6 E101.84 F1200 ;outside peg
G1 X42 Y25.05 E101.858 F1200 ;outside peg
G1 X44.8 Y25.05 E101.97 F1200 ;outside peg
G1 X42 Y25.5 E102.08344 F1200 ;outside peg
G1 X44.8 Y25.5 E102.19544 F1200 ;outside peg
G1 X42 Y25.5 E102.30744 F1200 ;outside peg
G1 X42 Y25.95 E102.32544 F1200 ;outside peg
G1 X44.8 Y25.95 E102.43744 F1200 ;outside peg
G1 X42 Y26.4 E102.55087 F1200 ;outside peg
G1 X44.8 Y26.4 E102.66287 F1200 ;outside peg
G1 X42 Y26.4 E102.77487 F1200 ;outside peg
G1 X42 Y26.85 E102.79287 F1200 ;outside peg
G1 X44.8 Y26.85 E102.90487 F1200 ;outside peg
G1 X42 Y27.3 E103.01831 F1200 ;outside peg
G1 X44.8 Y27.3 E103.13031 F1200 ;outside peg
G1 X42 Y27.3 E103.24231 F1200 ;outside peg
G1 X42 Y27.4 E103.24631 F1200 ;outside peg
G1 X44.8 Y27.4 E103.35831 F1200 ;outside peg
G1 E102.55831 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X38 Y34 F1200 ;wire loop travel
G0 Z1.4 F1200 ;split z-drop
G1 E103.35831 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X38 Y32.6 E103.41431 F1200 ;outside peg
G1 X35.2 Y32.6 E103.52631 F1200 ;outside peg
G1 X38 Y32.6 E103.63831 F1200 ;outside peg
G1 X38 Y33.05 E103.65631 F1200 ;outside peg
G1 X35.2 Y33.05 E103.76831 F1200 ;outside peg
G1 X38 Y33.5 E103.88175 F1200 ;outside peg
G1 X35.2 Y33.5 E103.99375 F1200 ;outside peg
G1 X38 Y33.5 E104.10575 F1200 ;outside peg
G1 X38 Y33.95 E104.12375 F1200 ;outside peg
G1 X35.2 Y33.95 E104.23575 F1200 ;outside peg
G1 X38 Y34.4 E104.34919 F1200 ;outside peg
G1 X35.2 Y34.4 E104.46119 F1200 ;outside peg
G1 X38 Y34.4 E104.57319 F1200 ;outside peg
G1 X38 Y34.85 E104.59119 F1200 ;outside peg
G1 X35.2 Y34.85 E104.70319 F1200 ;outside peg
G1 X38 Y35.3 E104.81662 F1200 ;outside peg
G1 X35.2 Y35.3 E104.92862 F1200 ;outside peg
G1 X38 Y35.3 E105.04062 F1200 ;outside peg
G1 X38 Y35.4 E105.04462 F1200 ;outside peg
G1 X35.2 Y35.4 E105.15662 F1200 ;outside peg
G1 E104.35662 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X42 Y34 F1200 ;wire loop travel
G0 Z1.4 F1200 ;split z-drop
G1 E105.15662 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X42 Y32 E105.23662 F1200 ;wire loop
G1 X46 Y32 E105.39662 F1200 ;wire loop
G1 X46 Y36 E105.55662 F1200 ;wire loop
G1 X42 Y36 E105.71662 F1200 ;wire loop
G1 X42 Y32 E105.87662 F1200 ;wire loop
G1 E105.07662 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X54.5 Y38 F1200 ;wire loop return
G0 Z1.4 F1200 ;split z-drop
G1 E105.87662 F1800 ;split prime
G1 F1200 ;split restore feed
G92 E100.84 ;wire loop restore E
M400
;END SYNTHETIC FIXTURE
