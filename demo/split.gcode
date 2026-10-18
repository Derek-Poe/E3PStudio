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
M400
;END SYNTHETIC FIXTURE
