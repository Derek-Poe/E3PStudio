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
G0 X18 Y22.8 F1200 ;hardware pad travel
G0 Z0.4 F1200 ;split z-drop
G1 E24.64 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X12 Y22.8 E24.88 F1200 ;hardware pad
G1 X12 Y23.25 E24.898 F1200 ;hardware pad
G1 X18 Y23.25 E25.138 F1200 ;hardware pad
G1 X18 Y23.7 E25.156 F1200 ;hardware pad
G1 X12 Y23.7 E25.396 F1200 ;hardware pad
G1 X12 Y24.15 E25.414 F1200 ;hardware pad
G1 X18 Y24.15 E25.654 F1200 ;hardware pad
G1 X18 Y24.6 E25.672 F1200 ;hardware pad
G1 X12 Y24.6 E25.912 F1200 ;hardware pad
G1 X12 Y25.05 E25.93 F1200 ;hardware pad
G1 X18 Y25.05 E26.17 F1200 ;hardware pad
G1 X18 Y25.5 E26.188 F1200 ;hardware pad
G1 X12 Y25.5 E26.428 F1200 ;hardware pad
G1 X12 Y25.95 E26.446 F1200 ;hardware pad
G1 X18 Y25.95 E26.686 F1200 ;hardware pad
G1 X18 Y26.4 E26.704 F1200 ;hardware pad
G1 X12 Y26.4 E26.944 F1200 ;hardware pad
G1 X12 Y26.85 E26.962 F1200 ;hardware pad
G1 X18 Y26.85 E27.202 F1200 ;hardware pad
G1 X18 Y27.3 E27.22 F1200 ;hardware pad
G1 X12 Y27.3 E27.46 F1200 ;hardware pad
G1 X12 Y27.75 E27.478 F1200 ;hardware pad
G1 X18 Y27.75 E27.718 F1200 ;hardware pad
G1 X18 Y28.2 E27.736 F1200 ;hardware pad
G1 X12 Y28.2 E27.976 F1200 ;hardware pad
G1 X12 Y28.65 E27.994 F1200 ;hardware pad
G1 X18 Y28.65 E28.234 F1200 ;hardware pad
G1 X18 Y29.1 E28.252 F1200 ;hardware pad
G1 X12 Y29.1 E28.492 F1200 ;hardware pad
G1 X12 Y29.2 E28.496 F1200 ;hardware pad
G1 X18 Y29.2 E28.736 F1200 ;hardware pad
G1 E27.936 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X12 Y26 F1200 ;hardware joiner travel
G0 Z0.4 F1200 ;split z-drop
G1 E28.736 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X12 Y24 E28.816 F1200 ;frame loop
G1 X8 Y24 E28.976 F1200 ;frame loop
G1 X8 Y28 E29.136 F1200 ;frame loop
G1 X12 Y28 E29.296 F1200 ;frame loop
G1 X12 Y24 E29.456 F1200 ;frame loop
G1 E28.656 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X62 Y22.8 F1200 ;hardware pad travel
G0 Z0.4 F1200 ;split z-drop
G1 E29.456 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X68 Y22.8 E29.696 F1200 ;hardware pad
G1 X68 Y23.25 E29.714 F1200 ;hardware pad
G1 X62 Y23.25 E29.954 F1200 ;hardware pad
G1 X62 Y23.7 E29.972 F1200 ;hardware pad
G1 X68 Y23.7 E30.212 F1200 ;hardware pad
G1 X68 Y24.15 E30.23 F1200 ;hardware pad
G1 X62 Y24.15 E30.47 F1200 ;hardware pad
G1 X62 Y24.6 E30.488 F1200 ;hardware pad
G1 X68 Y24.6 E30.728 F1200 ;hardware pad
G1 X68 Y25.05 E30.746 F1200 ;hardware pad
G1 X62 Y25.05 E30.986 F1200 ;hardware pad
G1 X62 Y25.5 E31.004 F1200 ;hardware pad
G1 X68 Y25.5 E31.244 F1200 ;hardware pad
G1 X68 Y25.95 E31.262 F1200 ;hardware pad
G1 X62 Y25.95 E31.502 F1200 ;hardware pad
G1 X62 Y26.4 E31.52 F1200 ;hardware pad
G1 X68 Y26.4 E31.76 F1200 ;hardware pad
G1 X68 Y26.85 E31.778 F1200 ;hardware pad
G1 X62 Y26.85 E32.018 F1200 ;hardware pad
G1 X62 Y27.3 E32.036 F1200 ;hardware pad
G1 X68 Y27.3 E32.276 F1200 ;hardware pad
G1 X68 Y27.75 E32.294 F1200 ;hardware pad
G1 X62 Y27.75 E32.534 F1200 ;hardware pad
G1 X62 Y28.2 E32.552 F1200 ;hardware pad
G1 X68 Y28.2 E32.792 F1200 ;hardware pad
G1 X68 Y28.65 E32.81 F1200 ;hardware pad
G1 X62 Y28.65 E33.05 F1200 ;hardware pad
G1 X62 Y29.1 E33.068 F1200 ;hardware pad
G1 X68 Y29.1 E33.308 F1200 ;hardware pad
G1 X68 Y29.2 E33.312 F1200 ;hardware pad
G1 X62 Y29.2 E33.552 F1200 ;hardware pad
G1 E32.752 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X68 Y26 F1200 ;hardware joiner travel
G0 Z0.4 F1200 ;split z-drop
G1 E33.552 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X68 Y24.6 E33.608 F1200 ;frame peg
G1 X70.8 Y24.6 E33.72 F1200 ;frame peg
G1 X68 Y24.6 E33.832 F1200 ;frame peg
G1 X68 Y25.05 E33.85 F1200 ;frame peg
G1 X70.8 Y25.05 E33.962 F1200 ;frame peg
G1 X68 Y25.5 E34.07544 F1200 ;frame peg
G1 X70.8 Y25.5 E34.18744 F1200 ;frame peg
G1 X68 Y25.5 E34.29944 F1200 ;frame peg
G1 X68 Y25.95 E34.31744 F1200 ;frame peg
G1 X70.8 Y25.95 E34.42944 F1200 ;frame peg
G1 X68 Y26.4 E34.54287 F1200 ;frame peg
G1 X70.8 Y26.4 E34.65487 F1200 ;frame peg
G1 X68 Y26.4 E34.76687 F1200 ;frame peg
G1 X68 Y26.85 E34.78487 F1200 ;frame peg
G1 X70.8 Y26.85 E34.89687 F1200 ;frame peg
G1 X68 Y27.3 E35.01031 F1200 ;frame peg
G1 X70.8 Y27.3 E35.12231 F1200 ;frame peg
G1 X68 Y27.3 E35.23431 F1200 ;frame peg
G1 X68 Y27.4 E35.23831 F1200 ;frame peg
G1 X70.8 Y27.4 E35.35031 F1200 ;frame peg
G1 E34.55031 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X18 Y30.8 F1200 ;hardware pad travel
G0 Z0.4 F1200 ;split z-drop
G1 E35.35031 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X12 Y30.8 E35.59031 F1200 ;hardware pad
G1 X12 Y31.25 E35.60831 F1200 ;hardware pad
G1 X18 Y31.25 E35.84831 F1200 ;hardware pad
G1 X18 Y31.7 E35.86631 F1200 ;hardware pad
G1 X12 Y31.7 E36.10631 F1200 ;hardware pad
G1 X12 Y32.15 E36.12431 F1200 ;hardware pad
G1 X18 Y32.15 E36.36431 F1200 ;hardware pad
G1 X18 Y32.6 E36.38231 F1200 ;hardware pad
G1 X12 Y32.6 E36.62231 F1200 ;hardware pad
G1 X12 Y33.05 E36.64031 F1200 ;hardware pad
G1 X18 Y33.05 E36.88031 F1200 ;hardware pad
G1 X18 Y33.5 E36.89831 F1200 ;hardware pad
G1 X12 Y33.5 E37.13831 F1200 ;hardware pad
G1 X12 Y33.95 E37.15631 F1200 ;hardware pad
G1 X18 Y33.95 E37.39631 F1200 ;hardware pad
G1 X18 Y34.4 E37.41431 F1200 ;hardware pad
G1 X12 Y34.4 E37.65431 F1200 ;hardware pad
G1 X12 Y34.85 E37.67231 F1200 ;hardware pad
G1 X18 Y34.85 E37.91231 F1200 ;hardware pad
G1 X18 Y35.3 E37.93031 F1200 ;hardware pad
G1 X12 Y35.3 E38.17031 F1200 ;hardware pad
G1 X12 Y35.75 E38.18831 F1200 ;hardware pad
G1 X18 Y35.75 E38.42831 F1200 ;hardware pad
G1 X18 Y36.2 E38.44631 F1200 ;hardware pad
G1 X12 Y36.2 E38.68631 F1200 ;hardware pad
G1 X12 Y36.65 E38.70431 F1200 ;hardware pad
G1 X18 Y36.65 E38.94431 F1200 ;hardware pad
G1 X18 Y37.1 E38.96231 F1200 ;hardware pad
G1 X12 Y37.1 E39.20231 F1200 ;hardware pad
G1 X12 Y37.2 E39.20631 F1200 ;hardware pad
G1 X18 Y37.2 E39.44631 F1200 ;hardware pad
G1 E38.64631 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X12 Y34 F1200 ;hardware joiner travel
G0 Z0.4 F1200 ;split z-drop
G1 E39.44631 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X12 Y32.6 E39.50231 F1200 ;frame peg
G1 X9.2 Y32.6 E39.61431 F1200 ;frame peg
G1 X12 Y32.6 E39.72631 F1200 ;frame peg
G1 X12 Y33.05 E39.74431 F1200 ;frame peg
G1 X9.2 Y33.05 E39.85631 F1200 ;frame peg
G1 X12 Y33.5 E39.96975 F1200 ;frame peg
G1 X9.2 Y33.5 E40.08175 F1200 ;frame peg
G1 X12 Y33.5 E40.19375 F1200 ;frame peg
G1 X12 Y33.95 E40.21175 F1200 ;frame peg
G1 X9.2 Y33.95 E40.32375 F1200 ;frame peg
G1 X12 Y34.4 E40.43719 F1200 ;frame peg
G1 X9.2 Y34.4 E40.54919 F1200 ;frame peg
G1 X12 Y34.4 E40.66119 F1200 ;frame peg
G1 X12 Y34.85 E40.67919 F1200 ;frame peg
G1 X9.2 Y34.85 E40.79119 F1200 ;frame peg
G1 X12 Y35.3 E40.90462 F1200 ;frame peg
G1 X9.2 Y35.3 E41.01662 F1200 ;frame peg
G1 X12 Y35.3 E41.12862 F1200 ;frame peg
G1 X12 Y35.4 E41.13262 F1200 ;frame peg
G1 X9.2 Y35.4 E41.24462 F1200 ;frame peg
G1 E40.44462 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X62 Y30.8 F1200 ;hardware pad travel
G0 Z0.4 F1200 ;split z-drop
G1 E41.24462 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X68 Y30.8 E41.48462 F1200 ;hardware pad
G1 X68 Y31.25 E41.50262 F1200 ;hardware pad
G1 X62 Y31.25 E41.74262 F1200 ;hardware pad
G1 X62 Y31.7 E41.76062 F1200 ;hardware pad
G1 X68 Y31.7 E42.00062 F1200 ;hardware pad
G1 X68 Y32.15 E42.01862 F1200 ;hardware pad
G1 X62 Y32.15 E42.25862 F1200 ;hardware pad
G1 X62 Y32.6 E42.27662 F1200 ;hardware pad
G1 X68 Y32.6 E42.51662 F1200 ;hardware pad
G1 X68 Y33.05 E42.53462 F1200 ;hardware pad
G1 X62 Y33.05 E42.77462 F1200 ;hardware pad
G1 X62 Y33.5 E42.79262 F1200 ;hardware pad
G1 X68 Y33.5 E43.03262 F1200 ;hardware pad
G1 X68 Y33.95 E43.05062 F1200 ;hardware pad
G1 X62 Y33.95 E43.29062 F1200 ;hardware pad
G1 X62 Y34.4 E43.30862 F1200 ;hardware pad
G1 X68 Y34.4 E43.54862 F1200 ;hardware pad
G1 X68 Y34.85 E43.56662 F1200 ;hardware pad
G1 X62 Y34.85 E43.80662 F1200 ;hardware pad
G1 X62 Y35.3 E43.82462 F1200 ;hardware pad
G1 X68 Y35.3 E44.06462 F1200 ;hardware pad
G1 X68 Y35.75 E44.08262 F1200 ;hardware pad
G1 X62 Y35.75 E44.32262 F1200 ;hardware pad
G1 X62 Y36.2 E44.34062 F1200 ;hardware pad
G1 X68 Y36.2 E44.58062 F1200 ;hardware pad
G1 X68 Y36.65 E44.59862 F1200 ;hardware pad
G1 X62 Y36.65 E44.83862 F1200 ;hardware pad
G1 X62 Y37.1 E44.85662 F1200 ;hardware pad
G1 X68 Y37.1 E45.09662 F1200 ;hardware pad
G1 X68 Y37.2 E45.10062 F1200 ;hardware pad
G1 X62 Y37.2 E45.34062 F1200 ;hardware pad
G1 E44.54062 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X68 Y34 F1200 ;hardware joiner travel
G0 Z0.4 F1200 ;split z-drop
G1 E45.34062 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X68 Y32 E45.42062 F1200 ;frame loop
G1 X72 Y32 E45.58062 F1200 ;frame loop
G1 X72 Y36 E45.74062 F1200 ;frame loop
G1 X68 Y36 E45.90062 F1200 ;frame loop
G1 X68 Y32 E46.06062 F1200 ;frame loop
G1 E45.26062 F1800 ;split retract
G0 Z1 F1200 ;split z-hop
G0 X62 Y38 F1200 ;hardware pad return
G0 Z0.4 F1200 ;split z-drop
G1 E46.06062 F1800 ;split prime
G1 F1200 ;split restore feed
G92 E24.64 ;hardware pad restore E
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
G0 X19.5 Y22.8 F1200 ;hardware pad travel
G0 Z0.6 F1200 ;split z-drop
G1 E42.52 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X13.5 Y22.8 E42.76 F1200 ;hardware pad
G1 X13.5 Y23.25 E42.778 F1200 ;hardware pad
G1 X19.5 Y23.25 E43.018 F1200 ;hardware pad
G1 X19.5 Y23.7 E43.036 F1200 ;hardware pad
G1 X13.5 Y23.7 E43.276 F1200 ;hardware pad
G1 X13.5 Y24.15 E43.294 F1200 ;hardware pad
G1 X19.5 Y24.15 E43.534 F1200 ;hardware pad
G1 X19.5 Y24.6 E43.552 F1200 ;hardware pad
G1 X13.5 Y24.6 E43.792 F1200 ;hardware pad
G1 X13.5 Y25.05 E43.81 F1200 ;hardware pad
G1 X19.5 Y25.05 E44.05 F1200 ;hardware pad
G1 X19.5 Y25.5 E44.068 F1200 ;hardware pad
G1 X13.5 Y25.5 E44.308 F1200 ;hardware pad
G1 X13.5 Y25.95 E44.326 F1200 ;hardware pad
G1 X19.5 Y25.95 E44.566 F1200 ;hardware pad
G1 X19.5 Y26.4 E44.584 F1200 ;hardware pad
G1 X13.5 Y26.4 E44.824 F1200 ;hardware pad
G1 X13.5 Y26.85 E44.842 F1200 ;hardware pad
G1 X19.5 Y26.85 E45.082 F1200 ;hardware pad
G1 X19.5 Y27.3 E45.1 F1200 ;hardware pad
G1 X13.5 Y27.3 E45.34 F1200 ;hardware pad
G1 X13.5 Y27.75 E45.358 F1200 ;hardware pad
G1 X19.5 Y27.75 E45.598 F1200 ;hardware pad
G1 X19.5 Y28.2 E45.616 F1200 ;hardware pad
G1 X13.5 Y28.2 E45.856 F1200 ;hardware pad
G1 X13.5 Y28.65 E45.874 F1200 ;hardware pad
G1 X19.5 Y28.65 E46.114 F1200 ;hardware pad
G1 X19.5 Y29.1 E46.132 F1200 ;hardware pad
G1 X13.5 Y29.1 E46.372 F1200 ;hardware pad
G1 X13.5 Y29.2 E46.376 F1200 ;hardware pad
G1 X19.5 Y29.2 E46.616 F1200 ;hardware pad
G1 E45.816 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X13.5 Y26 F1200 ;hardware joiner travel
G0 Z0.6 F1200 ;split z-drop
G1 E46.616 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X13.5 Y24 E46.696 F1200 ;frame loop
G1 X9.5 Y24 E46.856 F1200 ;frame loop
G1 X9.5 Y28 E47.016 F1200 ;frame loop
G1 X13.5 Y28 E47.176 F1200 ;frame loop
G1 X13.5 Y24 E47.336 F1200 ;frame loop
G1 E46.536 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X60.5 Y22.8 F1200 ;hardware pad travel
G0 Z0.6 F1200 ;split z-drop
G1 E47.336 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X66.5 Y22.8 E47.576 F1200 ;hardware pad
G1 X66.5 Y23.25 E47.594 F1200 ;hardware pad
G1 X60.5 Y23.25 E47.834 F1200 ;hardware pad
G1 X60.5 Y23.7 E47.852 F1200 ;hardware pad
G1 X66.5 Y23.7 E48.092 F1200 ;hardware pad
G1 X66.5 Y24.15 E48.11 F1200 ;hardware pad
G1 X60.5 Y24.15 E48.35 F1200 ;hardware pad
G1 X60.5 Y24.6 E48.368 F1200 ;hardware pad
G1 X66.5 Y24.6 E48.608 F1200 ;hardware pad
G1 X66.5 Y25.05 E48.626 F1200 ;hardware pad
G1 X60.5 Y25.05 E48.866 F1200 ;hardware pad
G1 X60.5 Y25.5 E48.884 F1200 ;hardware pad
G1 X66.5 Y25.5 E49.124 F1200 ;hardware pad
G1 X66.5 Y25.95 E49.142 F1200 ;hardware pad
G1 X60.5 Y25.95 E49.382 F1200 ;hardware pad
G1 X60.5 Y26.4 E49.4 F1200 ;hardware pad
G1 X66.5 Y26.4 E49.64 F1200 ;hardware pad
G1 X66.5 Y26.85 E49.658 F1200 ;hardware pad
G1 X60.5 Y26.85 E49.898 F1200 ;hardware pad
G1 X60.5 Y27.3 E49.916 F1200 ;hardware pad
G1 X66.5 Y27.3 E50.156 F1200 ;hardware pad
G1 X66.5 Y27.75 E50.174 F1200 ;hardware pad
G1 X60.5 Y27.75 E50.414 F1200 ;hardware pad
G1 X60.5 Y28.2 E50.432 F1200 ;hardware pad
G1 X66.5 Y28.2 E50.672 F1200 ;hardware pad
G1 X66.5 Y28.65 E50.69 F1200 ;hardware pad
G1 X60.5 Y28.65 E50.93 F1200 ;hardware pad
G1 X60.5 Y29.1 E50.948 F1200 ;hardware pad
G1 X66.5 Y29.1 E51.188 F1200 ;hardware pad
G1 X66.5 Y29.2 E51.192 F1200 ;hardware pad
G1 X60.5 Y29.2 E51.432 F1200 ;hardware pad
G1 E50.632 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X66.5 Y26 F1200 ;hardware joiner travel
G0 Z0.6 F1200 ;split z-drop
G1 E51.432 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X66.5 Y24.6 E51.488 F1200 ;frame peg
G1 X69.3 Y24.6 E51.6 F1200 ;frame peg
G1 X66.5 Y24.6 E51.712 F1200 ;frame peg
G1 X66.5 Y25.05 E51.73 F1200 ;frame peg
G1 X69.3 Y25.05 E51.842 F1200 ;frame peg
G1 X66.5 Y25.5 E51.95544 F1200 ;frame peg
G1 X69.3 Y25.5 E52.06744 F1200 ;frame peg
G1 X66.5 Y25.5 E52.17944 F1200 ;frame peg
G1 X66.5 Y25.95 E52.19744 F1200 ;frame peg
G1 X69.3 Y25.95 E52.30944 F1200 ;frame peg
G1 X66.5 Y26.4 E52.42287 F1200 ;frame peg
G1 X69.3 Y26.4 E52.53487 F1200 ;frame peg
G1 X66.5 Y26.4 E52.64687 F1200 ;frame peg
G1 X66.5 Y26.85 E52.66487 F1200 ;frame peg
G1 X69.3 Y26.85 E52.77687 F1200 ;frame peg
G1 X66.5 Y27.3 E52.89031 F1200 ;frame peg
G1 X69.3 Y27.3 E53.00231 F1200 ;frame peg
G1 X66.5 Y27.3 E53.11431 F1200 ;frame peg
G1 X66.5 Y27.4 E53.11831 F1200 ;frame peg
G1 X69.3 Y27.4 E53.23031 F1200 ;frame peg
G1 E52.43031 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X19.5 Y30.8 F1200 ;hardware pad travel
G0 Z0.6 F1200 ;split z-drop
G1 E53.23031 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X13.5 Y30.8 E53.47031 F1200 ;hardware pad
G1 X13.5 Y31.25 E53.48831 F1200 ;hardware pad
G1 X19.5 Y31.25 E53.72831 F1200 ;hardware pad
G1 X19.5 Y31.7 E53.74631 F1200 ;hardware pad
G1 X13.5 Y31.7 E53.98631 F1200 ;hardware pad
G1 X13.5 Y32.15 E54.00431 F1200 ;hardware pad
G1 X19.5 Y32.15 E54.24431 F1200 ;hardware pad
G1 X19.5 Y32.6 E54.26231 F1200 ;hardware pad
G1 X13.5 Y32.6 E54.50231 F1200 ;hardware pad
G1 X13.5 Y33.05 E54.52031 F1200 ;hardware pad
G1 X19.5 Y33.05 E54.76031 F1200 ;hardware pad
G1 X19.5 Y33.5 E54.77831 F1200 ;hardware pad
G1 X13.5 Y33.5 E55.01831 F1200 ;hardware pad
G1 X13.5 Y33.95 E55.03631 F1200 ;hardware pad
G1 X19.5 Y33.95 E55.27631 F1200 ;hardware pad
G1 X19.5 Y34.4 E55.29431 F1200 ;hardware pad
G1 X13.5 Y34.4 E55.53431 F1200 ;hardware pad
G1 X13.5 Y34.85 E55.55231 F1200 ;hardware pad
G1 X19.5 Y34.85 E55.79231 F1200 ;hardware pad
G1 X19.5 Y35.3 E55.81031 F1200 ;hardware pad
G1 X13.5 Y35.3 E56.05031 F1200 ;hardware pad
G1 X13.5 Y35.75 E56.06831 F1200 ;hardware pad
G1 X19.5 Y35.75 E56.30831 F1200 ;hardware pad
G1 X19.5 Y36.2 E56.32631 F1200 ;hardware pad
G1 X13.5 Y36.2 E56.56631 F1200 ;hardware pad
G1 X13.5 Y36.65 E56.58431 F1200 ;hardware pad
G1 X19.5 Y36.65 E56.82431 F1200 ;hardware pad
G1 X19.5 Y37.1 E56.84231 F1200 ;hardware pad
G1 X13.5 Y37.1 E57.08231 F1200 ;hardware pad
G1 X13.5 Y37.2 E57.08631 F1200 ;hardware pad
G1 X19.5 Y37.2 E57.32631 F1200 ;hardware pad
G1 E56.52631 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X13.5 Y34 F1200 ;hardware joiner travel
G0 Z0.6 F1200 ;split z-drop
G1 E57.32631 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X13.5 Y32.6 E57.38231 F1200 ;frame peg
G1 X10.7 Y32.6 E57.49431 F1200 ;frame peg
G1 X13.5 Y32.6 E57.60631 F1200 ;frame peg
G1 X13.5 Y33.05 E57.62431 F1200 ;frame peg
G1 X10.7 Y33.05 E57.73631 F1200 ;frame peg
G1 X13.5 Y33.5 E57.84975 F1200 ;frame peg
G1 X10.7 Y33.5 E57.96175 F1200 ;frame peg
G1 X13.5 Y33.5 E58.07375 F1200 ;frame peg
G1 X13.5 Y33.95 E58.09175 F1200 ;frame peg
G1 X10.7 Y33.95 E58.20375 F1200 ;frame peg
G1 X13.5 Y34.4 E58.31719 F1200 ;frame peg
G1 X10.7 Y34.4 E58.42919 F1200 ;frame peg
G1 X13.5 Y34.4 E58.54119 F1200 ;frame peg
G1 X13.5 Y34.85 E58.55919 F1200 ;frame peg
G1 X10.7 Y34.85 E58.67119 F1200 ;frame peg
G1 X13.5 Y35.3 E58.78462 F1200 ;frame peg
G1 X10.7 Y35.3 E58.89662 F1200 ;frame peg
G1 X13.5 Y35.3 E59.00862 F1200 ;frame peg
G1 X13.5 Y35.4 E59.01262 F1200 ;frame peg
G1 X10.7 Y35.4 E59.12462 F1200 ;frame peg
G1 E58.32462 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X60.5 Y30.8 F1200 ;hardware pad travel
G0 Z0.6 F1200 ;split z-drop
G1 E59.12462 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X66.5 Y30.8 E59.36462 F1200 ;hardware pad
G1 X66.5 Y31.25 E59.38262 F1200 ;hardware pad
G1 X60.5 Y31.25 E59.62262 F1200 ;hardware pad
G1 X60.5 Y31.7 E59.64062 F1200 ;hardware pad
G1 X66.5 Y31.7 E59.88062 F1200 ;hardware pad
G1 X66.5 Y32.15 E59.89862 F1200 ;hardware pad
G1 X60.5 Y32.15 E60.13862 F1200 ;hardware pad
G1 X60.5 Y32.6 E60.15662 F1200 ;hardware pad
G1 X66.5 Y32.6 E60.39662 F1200 ;hardware pad
G1 X66.5 Y33.05 E60.41462 F1200 ;hardware pad
G1 X60.5 Y33.05 E60.65462 F1200 ;hardware pad
G1 X60.5 Y33.5 E60.67262 F1200 ;hardware pad
G1 X66.5 Y33.5 E60.91262 F1200 ;hardware pad
G1 X66.5 Y33.95 E60.93062 F1200 ;hardware pad
G1 X60.5 Y33.95 E61.17062 F1200 ;hardware pad
G1 X60.5 Y34.4 E61.18862 F1200 ;hardware pad
G1 X66.5 Y34.4 E61.42862 F1200 ;hardware pad
G1 X66.5 Y34.85 E61.44662 F1200 ;hardware pad
G1 X60.5 Y34.85 E61.68662 F1200 ;hardware pad
G1 X60.5 Y35.3 E61.70462 F1200 ;hardware pad
G1 X66.5 Y35.3 E61.94462 F1200 ;hardware pad
G1 X66.5 Y35.75 E61.96262 F1200 ;hardware pad
G1 X60.5 Y35.75 E62.20262 F1200 ;hardware pad
G1 X60.5 Y36.2 E62.22062 F1200 ;hardware pad
G1 X66.5 Y36.2 E62.46062 F1200 ;hardware pad
G1 X66.5 Y36.65 E62.47862 F1200 ;hardware pad
G1 X60.5 Y36.65 E62.71862 F1200 ;hardware pad
G1 X60.5 Y37.1 E62.73662 F1200 ;hardware pad
G1 X66.5 Y37.1 E62.97662 F1200 ;hardware pad
G1 X66.5 Y37.2 E62.98062 F1200 ;hardware pad
G1 X60.5 Y37.2 E63.22062 F1200 ;hardware pad
G1 E62.42062 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X66.5 Y34 F1200 ;hardware joiner travel
G0 Z0.6 F1200 ;split z-drop
G1 E63.22062 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X66.5 Y32 E63.30062 F1200 ;frame loop
G1 X70.5 Y32 E63.46062 F1200 ;frame loop
G1 X70.5 Y36 E63.62062 F1200 ;frame loop
G1 X66.5 Y36 E63.78062 F1200 ;frame loop
G1 X66.5 Y32 E63.94062 F1200 ;frame loop
G1 E63.14062 F1800 ;split retract
G0 Z1.2 F1200 ;split z-hop
G0 X60.5 Y38 F1200 ;hardware pad return
G0 Z0.6 F1200 ;split z-drop
G1 E63.94062 F1800 ;split prime
G1 F1200 ;split restore feed
G92 E42.52 ;hardware pad restore E
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
G1 E87.44 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X24 Y22.8 F1200 ;hardware pad travel
G0 Z1.2 F1200 ;split z-drop
G1 E88.24 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X18 Y22.8 E88.48 F1200 ;hardware pad
G1 X18 Y23.25 E88.498 F1200 ;hardware pad
G1 X24 Y23.25 E88.738 F1200 ;hardware pad
G1 X24 Y23.7 E88.756 F1200 ;hardware pad
G1 X18 Y23.7 E88.996 F1200 ;hardware pad
G1 X18 Y24.15 E89.014 F1200 ;hardware pad
G1 X24 Y24.15 E89.254 F1200 ;hardware pad
G1 X24 Y24.6 E89.272 F1200 ;hardware pad
G1 X18 Y24.6 E89.512 F1200 ;hardware pad
G1 X18 Y25.05 E89.53 F1200 ;hardware pad
G1 X24 Y25.05 E89.77 F1200 ;hardware pad
G1 X24 Y25.5 E89.788 F1200 ;hardware pad
G1 X18 Y25.5 E90.028 F1200 ;hardware pad
G1 X18 Y25.95 E90.046 F1200 ;hardware pad
G1 X24 Y25.95 E90.286 F1200 ;hardware pad
G1 X24 Y26.4 E90.304 F1200 ;hardware pad
G1 X18 Y26.4 E90.544 F1200 ;hardware pad
G1 X18 Y26.85 E90.562 F1200 ;hardware pad
G1 X24 Y26.85 E90.802 F1200 ;hardware pad
G1 X24 Y27.3 E90.82 F1200 ;hardware pad
G1 X18 Y27.3 E91.06 F1200 ;hardware pad
G1 X18 Y27.75 E91.078 F1200 ;hardware pad
G1 X24 Y27.75 E91.318 F1200 ;hardware pad
G1 X24 Y28.2 E91.336 F1200 ;hardware pad
G1 X18 Y28.2 E91.576 F1200 ;hardware pad
G1 X18 Y28.65 E91.594 F1200 ;hardware pad
G1 X24 Y28.65 E91.834 F1200 ;hardware pad
G1 X24 Y29.1 E91.852 F1200 ;hardware pad
G1 X18 Y29.1 E92.092 F1200 ;hardware pad
G1 X18 Y29.2 E92.096 F1200 ;hardware pad
G1 X24 Y29.2 E92.336 F1200 ;hardware pad
G1 E91.536 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X18 Y26 F1200 ;hardware joiner travel
G0 Z1.2 F1200 ;split z-drop
G1 E92.336 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X18 Y24 E92.416 F1200 ;frame loop
G1 X14 Y24 E92.576 F1200 ;frame loop
G1 X14 Y28 E92.736 F1200 ;frame loop
G1 X18 Y28 E92.896 F1200 ;frame loop
G1 X18 Y24 E93.056 F1200 ;frame loop
G1 E92.256 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X56 Y22.8 F1200 ;hardware pad travel
G0 Z1.2 F1200 ;split z-drop
G1 E93.056 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X62 Y22.8 E93.296 F1200 ;hardware pad
G1 X62 Y23.25 E93.314 F1200 ;hardware pad
G1 X56 Y23.25 E93.554 F1200 ;hardware pad
G1 X56 Y23.7 E93.572 F1200 ;hardware pad
G1 X62 Y23.7 E93.812 F1200 ;hardware pad
G1 X62 Y24.15 E93.83 F1200 ;hardware pad
G1 X56 Y24.15 E94.07 F1200 ;hardware pad
G1 X56 Y24.6 E94.088 F1200 ;hardware pad
G1 X62 Y24.6 E94.328 F1200 ;hardware pad
G1 X62 Y25.05 E94.346 F1200 ;hardware pad
G1 X56 Y25.05 E94.586 F1200 ;hardware pad
G1 X56 Y25.5 E94.604 F1200 ;hardware pad
G1 X62 Y25.5 E94.844 F1200 ;hardware pad
G1 X62 Y25.95 E94.862 F1200 ;hardware pad
G1 X56 Y25.95 E95.102 F1200 ;hardware pad
G1 X56 Y26.4 E95.12 F1200 ;hardware pad
G1 X62 Y26.4 E95.36 F1200 ;hardware pad
G1 X62 Y26.85 E95.378 F1200 ;hardware pad
G1 X56 Y26.85 E95.618 F1200 ;hardware pad
G1 X56 Y27.3 E95.636 F1200 ;hardware pad
G1 X62 Y27.3 E95.876 F1200 ;hardware pad
G1 X62 Y27.75 E95.894 F1200 ;hardware pad
G1 X56 Y27.75 E96.134 F1200 ;hardware pad
G1 X56 Y28.2 E96.152 F1200 ;hardware pad
G1 X62 Y28.2 E96.392 F1200 ;hardware pad
G1 X62 Y28.65 E96.41 F1200 ;hardware pad
G1 X56 Y28.65 E96.65 F1200 ;hardware pad
G1 X56 Y29.1 E96.668 F1200 ;hardware pad
G1 X62 Y29.1 E96.908 F1200 ;hardware pad
G1 X62 Y29.2 E96.912 F1200 ;hardware pad
G1 X56 Y29.2 E97.152 F1200 ;hardware pad
G1 E96.352 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X62 Y26 F1200 ;hardware joiner travel
G0 Z1.2 F1200 ;split z-drop
G1 E97.152 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X62 Y24.6 E97.208 F1200 ;frame peg
G1 X64.8 Y24.6 E97.32 F1200 ;frame peg
G1 X62 Y24.6 E97.432 F1200 ;frame peg
G1 X62 Y25.05 E97.45 F1200 ;frame peg
G1 X64.8 Y25.05 E97.562 F1200 ;frame peg
G1 X62 Y25.5 E97.67544 F1200 ;frame peg
G1 X64.8 Y25.5 E97.78744 F1200 ;frame peg
G1 X62 Y25.5 E97.89944 F1200 ;frame peg
G1 X62 Y25.95 E97.91744 F1200 ;frame peg
G1 X64.8 Y25.95 E98.02944 F1200 ;frame peg
G1 X62 Y26.4 E98.14287 F1200 ;frame peg
G1 X64.8 Y26.4 E98.25487 F1200 ;frame peg
G1 X62 Y26.4 E98.36687 F1200 ;frame peg
G1 X62 Y26.85 E98.38487 F1200 ;frame peg
G1 X64.8 Y26.85 E98.49687 F1200 ;frame peg
G1 X62 Y27.3 E98.61031 F1200 ;frame peg
G1 X64.8 Y27.3 E98.72231 F1200 ;frame peg
G1 X62 Y27.3 E98.83431 F1200 ;frame peg
G1 X62 Y27.4 E98.83831 F1200 ;frame peg
G1 X64.8 Y27.4 E98.95031 F1200 ;frame peg
G1 E98.15031 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X24 Y30.8 F1200 ;hardware pad travel
G0 Z1.2 F1200 ;split z-drop
G1 E98.95031 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X18 Y30.8 E99.19031 F1200 ;hardware pad
G1 X18 Y31.25 E99.20831 F1200 ;hardware pad
G1 X24 Y31.25 E99.44831 F1200 ;hardware pad
G1 X24 Y31.7 E99.46631 F1200 ;hardware pad
G1 X18 Y31.7 E99.70631 F1200 ;hardware pad
G1 X18 Y32.15 E99.72431 F1200 ;hardware pad
G1 X24 Y32.15 E99.96431 F1200 ;hardware pad
G1 X24 Y32.6 E99.98231 F1200 ;hardware pad
G1 X18 Y32.6 E100.22231 F1200 ;hardware pad
G1 X18 Y33.05 E100.24031 F1200 ;hardware pad
G1 X24 Y33.05 E100.48031 F1200 ;hardware pad
G1 X24 Y33.5 E100.49831 F1200 ;hardware pad
G1 X18 Y33.5 E100.73831 F1200 ;hardware pad
G1 X18 Y33.95 E100.75631 F1200 ;hardware pad
G1 X24 Y33.95 E100.99631 F1200 ;hardware pad
G1 X24 Y34.4 E101.01431 F1200 ;hardware pad
G1 X18 Y34.4 E101.25431 F1200 ;hardware pad
G1 X18 Y34.85 E101.27231 F1200 ;hardware pad
G1 X24 Y34.85 E101.51231 F1200 ;hardware pad
G1 X24 Y35.3 E101.53031 F1200 ;hardware pad
G1 X18 Y35.3 E101.77031 F1200 ;hardware pad
G1 X18 Y35.75 E101.78831 F1200 ;hardware pad
G1 X24 Y35.75 E102.02831 F1200 ;hardware pad
G1 X24 Y36.2 E102.04631 F1200 ;hardware pad
G1 X18 Y36.2 E102.28631 F1200 ;hardware pad
G1 X18 Y36.65 E102.30431 F1200 ;hardware pad
G1 X24 Y36.65 E102.54431 F1200 ;hardware pad
G1 X24 Y37.1 E102.56231 F1200 ;hardware pad
G1 X18 Y37.1 E102.80231 F1200 ;hardware pad
G1 X18 Y37.2 E102.80631 F1200 ;hardware pad
G1 X24 Y37.2 E103.04631 F1200 ;hardware pad
G1 E102.24631 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X18 Y34 F1200 ;hardware joiner travel
G0 Z1.2 F1200 ;split z-drop
G1 E103.04631 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X18 Y32.6 E103.10231 F1200 ;frame peg
G1 X15.2 Y32.6 E103.21431 F1200 ;frame peg
G1 X18 Y32.6 E103.32631 F1200 ;frame peg
G1 X18 Y33.05 E103.34431 F1200 ;frame peg
G1 X15.2 Y33.05 E103.45631 F1200 ;frame peg
G1 X18 Y33.5 E103.56975 F1200 ;frame peg
G1 X15.2 Y33.5 E103.68175 F1200 ;frame peg
G1 X18 Y33.5 E103.79375 F1200 ;frame peg
G1 X18 Y33.95 E103.81175 F1200 ;frame peg
G1 X15.2 Y33.95 E103.92375 F1200 ;frame peg
G1 X18 Y34.4 E104.03719 F1200 ;frame peg
G1 X15.2 Y34.4 E104.14919 F1200 ;frame peg
G1 X18 Y34.4 E104.26119 F1200 ;frame peg
G1 X18 Y34.85 E104.27919 F1200 ;frame peg
G1 X15.2 Y34.85 E104.39119 F1200 ;frame peg
G1 X18 Y35.3 E104.50462 F1200 ;frame peg
G1 X15.2 Y35.3 E104.61662 F1200 ;frame peg
G1 X18 Y35.3 E104.72862 F1200 ;frame peg
G1 X18 Y35.4 E104.73262 F1200 ;frame peg
G1 X15.2 Y35.4 E104.84462 F1200 ;frame peg
G1 E104.04462 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X56 Y30.8 F1200 ;hardware pad travel
G0 Z1.2 F1200 ;split z-drop
G1 E104.84462 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X62 Y30.8 E105.08462 F1200 ;hardware pad
G1 X62 Y31.25 E105.10262 F1200 ;hardware pad
G1 X56 Y31.25 E105.34262 F1200 ;hardware pad
G1 X56 Y31.7 E105.36062 F1200 ;hardware pad
G1 X62 Y31.7 E105.60062 F1200 ;hardware pad
G1 X62 Y32.15 E105.61862 F1200 ;hardware pad
G1 X56 Y32.15 E105.85862 F1200 ;hardware pad
G1 X56 Y32.6 E105.87662 F1200 ;hardware pad
G1 X62 Y32.6 E106.11662 F1200 ;hardware pad
G1 X62 Y33.05 E106.13462 F1200 ;hardware pad
G1 X56 Y33.05 E106.37462 F1200 ;hardware pad
G1 X56 Y33.5 E106.39262 F1200 ;hardware pad
G1 X62 Y33.5 E106.63262 F1200 ;hardware pad
G1 X62 Y33.95 E106.65062 F1200 ;hardware pad
G1 X56 Y33.95 E106.89062 F1200 ;hardware pad
G1 X56 Y34.4 E106.90862 F1200 ;hardware pad
G1 X62 Y34.4 E107.14862 F1200 ;hardware pad
G1 X62 Y34.85 E107.16662 F1200 ;hardware pad
G1 X56 Y34.85 E107.40662 F1200 ;hardware pad
G1 X56 Y35.3 E107.42462 F1200 ;hardware pad
G1 X62 Y35.3 E107.66462 F1200 ;hardware pad
G1 X62 Y35.75 E107.68262 F1200 ;hardware pad
G1 X56 Y35.75 E107.92262 F1200 ;hardware pad
G1 X56 Y36.2 E107.94062 F1200 ;hardware pad
G1 X62 Y36.2 E108.18062 F1200 ;hardware pad
G1 X62 Y36.65 E108.19862 F1200 ;hardware pad
G1 X56 Y36.65 E108.43862 F1200 ;hardware pad
G1 X56 Y37.1 E108.45662 F1200 ;hardware pad
G1 X62 Y37.1 E108.69662 F1200 ;hardware pad
G1 X62 Y37.2 E108.70062 F1200 ;hardware pad
G1 X56 Y37.2 E108.94062 F1200 ;hardware pad
G1 E108.14062 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X62 Y34 F1200 ;hardware joiner travel
G0 Z1.2 F1200 ;split z-drop
G1 E108.94062 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X62 Y32 E109.02062 F1200 ;frame loop
G1 X66 Y32 E109.18062 F1200 ;frame loop
G1 X66 Y36 E109.34062 F1200 ;frame loop
G1 X62 Y36 E109.50062 F1200 ;frame loop
G1 X62 Y32 E109.66062 F1200 ;frame loop
G1 E108.86062 F1800 ;split retract
G0 Z1.8 F1200 ;split z-hop
G0 X56 Y38 F1200 ;hardware pad return
G0 Z1.2 F1200 ;split z-drop
G1 E109.66062 F1800 ;split prime
G1 F1200 ;split restore feed
G92 E88.24 ;hardware pad restore E
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
G0 X25.5 Y22.8 F1200 ;hardware pad travel
G0 Z1.4 F1200 ;split z-drop
G1 E100.84 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X19.5 Y22.8 E101.08 F1200 ;hardware pad
G1 X19.5 Y23.25 E101.098 F1200 ;hardware pad
G1 X25.5 Y23.25 E101.338 F1200 ;hardware pad
G1 X25.5 Y23.7 E101.356 F1200 ;hardware pad
G1 X19.5 Y23.7 E101.596 F1200 ;hardware pad
G1 X19.5 Y24.15 E101.614 F1200 ;hardware pad
G1 X25.5 Y24.15 E101.854 F1200 ;hardware pad
G1 X25.5 Y24.6 E101.872 F1200 ;hardware pad
G1 X19.5 Y24.6 E102.112 F1200 ;hardware pad
G1 X19.5 Y25.05 E102.13 F1200 ;hardware pad
G1 X25.5 Y25.05 E102.37 F1200 ;hardware pad
G1 X25.5 Y25.5 E102.388 F1200 ;hardware pad
G1 X19.5 Y25.5 E102.628 F1200 ;hardware pad
G1 X19.5 Y25.95 E102.646 F1200 ;hardware pad
G1 X25.5 Y25.95 E102.886 F1200 ;hardware pad
G1 X25.5 Y26.4 E102.904 F1200 ;hardware pad
G1 X19.5 Y26.4 E103.144 F1200 ;hardware pad
G1 X19.5 Y26.85 E103.162 F1200 ;hardware pad
G1 X25.5 Y26.85 E103.402 F1200 ;hardware pad
G1 X25.5 Y27.3 E103.42 F1200 ;hardware pad
G1 X19.5 Y27.3 E103.66 F1200 ;hardware pad
G1 X19.5 Y27.75 E103.678 F1200 ;hardware pad
G1 X25.5 Y27.75 E103.918 F1200 ;hardware pad
G1 X25.5 Y28.2 E103.936 F1200 ;hardware pad
G1 X19.5 Y28.2 E104.176 F1200 ;hardware pad
G1 X19.5 Y28.65 E104.194 F1200 ;hardware pad
G1 X25.5 Y28.65 E104.434 F1200 ;hardware pad
G1 X25.5 Y29.1 E104.452 F1200 ;hardware pad
G1 X19.5 Y29.1 E104.692 F1200 ;hardware pad
G1 X19.5 Y29.2 E104.696 F1200 ;hardware pad
G1 X25.5 Y29.2 E104.936 F1200 ;hardware pad
G1 E104.136 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X19.5 Y26 F1200 ;hardware joiner travel
G0 Z1.4 F1200 ;split z-drop
G1 E104.936 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X19.5 Y24 E105.016 F1200 ;frame loop
G1 X15.5 Y24 E105.176 F1200 ;frame loop
G1 X15.5 Y28 E105.336 F1200 ;frame loop
G1 X19.5 Y28 E105.496 F1200 ;frame loop
G1 X19.5 Y24 E105.656 F1200 ;frame loop
G1 E104.856 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X54.5 Y22.8 F1200 ;hardware pad travel
G0 Z1.4 F1200 ;split z-drop
G1 E105.656 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X60.5 Y22.8 E105.896 F1200 ;hardware pad
G1 X60.5 Y23.25 E105.914 F1200 ;hardware pad
G1 X54.5 Y23.25 E106.154 F1200 ;hardware pad
G1 X54.5 Y23.7 E106.172 F1200 ;hardware pad
G1 X60.5 Y23.7 E106.412 F1200 ;hardware pad
G1 X60.5 Y24.15 E106.43 F1200 ;hardware pad
G1 X54.5 Y24.15 E106.67 F1200 ;hardware pad
G1 X54.5 Y24.6 E106.688 F1200 ;hardware pad
G1 X60.5 Y24.6 E106.928 F1200 ;hardware pad
G1 X60.5 Y25.05 E106.946 F1200 ;hardware pad
G1 X54.5 Y25.05 E107.186 F1200 ;hardware pad
G1 X54.5 Y25.5 E107.204 F1200 ;hardware pad
G1 X60.5 Y25.5 E107.444 F1200 ;hardware pad
G1 X60.5 Y25.95 E107.462 F1200 ;hardware pad
G1 X54.5 Y25.95 E107.702 F1200 ;hardware pad
G1 X54.5 Y26.4 E107.72 F1200 ;hardware pad
G1 X60.5 Y26.4 E107.96 F1200 ;hardware pad
G1 X60.5 Y26.85 E107.978 F1200 ;hardware pad
G1 X54.5 Y26.85 E108.218 F1200 ;hardware pad
G1 X54.5 Y27.3 E108.236 F1200 ;hardware pad
G1 X60.5 Y27.3 E108.476 F1200 ;hardware pad
G1 X60.5 Y27.75 E108.494 F1200 ;hardware pad
G1 X54.5 Y27.75 E108.734 F1200 ;hardware pad
G1 X54.5 Y28.2 E108.752 F1200 ;hardware pad
G1 X60.5 Y28.2 E108.992 F1200 ;hardware pad
G1 X60.5 Y28.65 E109.01 F1200 ;hardware pad
G1 X54.5 Y28.65 E109.25 F1200 ;hardware pad
G1 X54.5 Y29.1 E109.268 F1200 ;hardware pad
G1 X60.5 Y29.1 E109.508 F1200 ;hardware pad
G1 X60.5 Y29.2 E109.512 F1200 ;hardware pad
G1 X54.5 Y29.2 E109.752 F1200 ;hardware pad
G1 E108.952 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X60.5 Y26 F1200 ;hardware joiner travel
G0 Z1.4 F1200 ;split z-drop
G1 E109.752 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X60.5 Y24.6 E109.808 F1200 ;frame peg
G1 X63.3 Y24.6 E109.92 F1200 ;frame peg
G1 X60.5 Y24.6 E110.032 F1200 ;frame peg
G1 X60.5 Y25.05 E110.05 F1200 ;frame peg
G1 X63.3 Y25.05 E110.162 F1200 ;frame peg
G1 X60.5 Y25.5 E110.27544 F1200 ;frame peg
G1 X63.3 Y25.5 E110.38744 F1200 ;frame peg
G1 X60.5 Y25.5 E110.49944 F1200 ;frame peg
G1 X60.5 Y25.95 E110.51744 F1200 ;frame peg
G1 X63.3 Y25.95 E110.62944 F1200 ;frame peg
G1 X60.5 Y26.4 E110.74287 F1200 ;frame peg
G1 X63.3 Y26.4 E110.85487 F1200 ;frame peg
G1 X60.5 Y26.4 E110.96687 F1200 ;frame peg
G1 X60.5 Y26.85 E110.98487 F1200 ;frame peg
G1 X63.3 Y26.85 E111.09687 F1200 ;frame peg
G1 X60.5 Y27.3 E111.21031 F1200 ;frame peg
G1 X63.3 Y27.3 E111.32231 F1200 ;frame peg
G1 X60.5 Y27.3 E111.43431 F1200 ;frame peg
G1 X60.5 Y27.4 E111.43831 F1200 ;frame peg
G1 X63.3 Y27.4 E111.55031 F1200 ;frame peg
G1 E110.75031 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X25.5 Y30.8 F1200 ;hardware pad travel
G0 Z1.4 F1200 ;split z-drop
G1 E111.55031 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X19.5 Y30.8 E111.79031 F1200 ;hardware pad
G1 X19.5 Y31.25 E111.80831 F1200 ;hardware pad
G1 X25.5 Y31.25 E112.04831 F1200 ;hardware pad
G1 X25.5 Y31.7 E112.06631 F1200 ;hardware pad
G1 X19.5 Y31.7 E112.30631 F1200 ;hardware pad
G1 X19.5 Y32.15 E112.32431 F1200 ;hardware pad
G1 X25.5 Y32.15 E112.56431 F1200 ;hardware pad
G1 X25.5 Y32.6 E112.58231 F1200 ;hardware pad
G1 X19.5 Y32.6 E112.82231 F1200 ;hardware pad
G1 X19.5 Y33.05 E112.84031 F1200 ;hardware pad
G1 X25.5 Y33.05 E113.08031 F1200 ;hardware pad
G1 X25.5 Y33.5 E113.09831 F1200 ;hardware pad
G1 X19.5 Y33.5 E113.33831 F1200 ;hardware pad
G1 X19.5 Y33.95 E113.35631 F1200 ;hardware pad
G1 X25.5 Y33.95 E113.59631 F1200 ;hardware pad
G1 X25.5 Y34.4 E113.61431 F1200 ;hardware pad
G1 X19.5 Y34.4 E113.85431 F1200 ;hardware pad
G1 X19.5 Y34.85 E113.87231 F1200 ;hardware pad
G1 X25.5 Y34.85 E114.11231 F1200 ;hardware pad
G1 X25.5 Y35.3 E114.13031 F1200 ;hardware pad
G1 X19.5 Y35.3 E114.37031 F1200 ;hardware pad
G1 X19.5 Y35.75 E114.38831 F1200 ;hardware pad
G1 X25.5 Y35.75 E114.62831 F1200 ;hardware pad
G1 X25.5 Y36.2 E114.64631 F1200 ;hardware pad
G1 X19.5 Y36.2 E114.88631 F1200 ;hardware pad
G1 X19.5 Y36.65 E114.90431 F1200 ;hardware pad
G1 X25.5 Y36.65 E115.14431 F1200 ;hardware pad
G1 X25.5 Y37.1 E115.16231 F1200 ;hardware pad
G1 X19.5 Y37.1 E115.40231 F1200 ;hardware pad
G1 X19.5 Y37.2 E115.40631 F1200 ;hardware pad
G1 X25.5 Y37.2 E115.64631 F1200 ;hardware pad
G1 E114.84631 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X19.5 Y34 F1200 ;hardware joiner travel
G0 Z1.4 F1200 ;split z-drop
G1 E115.64631 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X19.5 Y32.6 E115.70231 F1200 ;frame peg
G1 X16.7 Y32.6 E115.81431 F1200 ;frame peg
G1 X19.5 Y32.6 E115.92631 F1200 ;frame peg
G1 X19.5 Y33.05 E115.94431 F1200 ;frame peg
G1 X16.7 Y33.05 E116.05631 F1200 ;frame peg
G1 X19.5 Y33.5 E116.16975 F1200 ;frame peg
G1 X16.7 Y33.5 E116.28175 F1200 ;frame peg
G1 X19.5 Y33.5 E116.39375 F1200 ;frame peg
G1 X19.5 Y33.95 E116.41175 F1200 ;frame peg
G1 X16.7 Y33.95 E116.52375 F1200 ;frame peg
G1 X19.5 Y34.4 E116.63719 F1200 ;frame peg
G1 X16.7 Y34.4 E116.74919 F1200 ;frame peg
G1 X19.5 Y34.4 E116.86119 F1200 ;frame peg
G1 X19.5 Y34.85 E116.87919 F1200 ;frame peg
G1 X16.7 Y34.85 E116.99119 F1200 ;frame peg
G1 X19.5 Y35.3 E117.10462 F1200 ;frame peg
G1 X16.7 Y35.3 E117.21662 F1200 ;frame peg
G1 X19.5 Y35.3 E117.32862 F1200 ;frame peg
G1 X19.5 Y35.4 E117.33262 F1200 ;frame peg
G1 X16.7 Y35.4 E117.44462 F1200 ;frame peg
G1 E116.64462 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X54.5 Y30.8 F1200 ;hardware pad travel
G0 Z1.4 F1200 ;split z-drop
G1 E117.44462 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X60.5 Y30.8 E117.68462 F1200 ;hardware pad
G1 X60.5 Y31.25 E117.70262 F1200 ;hardware pad
G1 X54.5 Y31.25 E117.94262 F1200 ;hardware pad
G1 X54.5 Y31.7 E117.96062 F1200 ;hardware pad
G1 X60.5 Y31.7 E118.20062 F1200 ;hardware pad
G1 X60.5 Y32.15 E118.21862 F1200 ;hardware pad
G1 X54.5 Y32.15 E118.45862 F1200 ;hardware pad
G1 X54.5 Y32.6 E118.47662 F1200 ;hardware pad
G1 X60.5 Y32.6 E118.71662 F1200 ;hardware pad
G1 X60.5 Y33.05 E118.73462 F1200 ;hardware pad
G1 X54.5 Y33.05 E118.97462 F1200 ;hardware pad
G1 X54.5 Y33.5 E118.99262 F1200 ;hardware pad
G1 X60.5 Y33.5 E119.23262 F1200 ;hardware pad
G1 X60.5 Y33.95 E119.25062 F1200 ;hardware pad
G1 X54.5 Y33.95 E119.49062 F1200 ;hardware pad
G1 X54.5 Y34.4 E119.50862 F1200 ;hardware pad
G1 X60.5 Y34.4 E119.74862 F1200 ;hardware pad
G1 X60.5 Y34.85 E119.76662 F1200 ;hardware pad
G1 X54.5 Y34.85 E120.00662 F1200 ;hardware pad
G1 X54.5 Y35.3 E120.02462 F1200 ;hardware pad
G1 X60.5 Y35.3 E120.26462 F1200 ;hardware pad
G1 X60.5 Y35.75 E120.28262 F1200 ;hardware pad
G1 X54.5 Y35.75 E120.52262 F1200 ;hardware pad
G1 X54.5 Y36.2 E120.54062 F1200 ;hardware pad
G1 X60.5 Y36.2 E120.78062 F1200 ;hardware pad
G1 X60.5 Y36.65 E120.79862 F1200 ;hardware pad
G1 X54.5 Y36.65 E121.03862 F1200 ;hardware pad
G1 X54.5 Y37.1 E121.05662 F1200 ;hardware pad
G1 X60.5 Y37.1 E121.29662 F1200 ;hardware pad
G1 X60.5 Y37.2 E121.30062 F1200 ;hardware pad
G1 X54.5 Y37.2 E121.54062 F1200 ;hardware pad
G1 E120.74062 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X60.5 Y34 F1200 ;hardware joiner travel
G0 Z1.4 F1200 ;split z-drop
G1 E121.54062 F1800 ;split prime
G1 F1200 ;split restore feed
G1 X60.5 Y32 E121.62062 F1200 ;frame loop
G1 X64.5 Y32 E121.78062 F1200 ;frame loop
G1 X64.5 Y36 E121.94062 F1200 ;frame loop
G1 X60.5 Y36 E122.10062 F1200 ;frame loop
G1 X60.5 Y32 E122.26062 F1200 ;frame loop
G1 E121.46062 F1800 ;split retract
G0 Z2 F1200 ;split z-hop
G0 X54.5 Y38 F1200 ;hardware pad return
G0 Z1.4 F1200 ;split z-drop
G1 E122.26062 F1800 ;split prime
G1 F1200 ;split restore feed
G92 E100.84 ;hardware pad restore E
M400
;END SYNTHETIC FIXTURE
