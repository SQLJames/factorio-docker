#!/bin/bash
cat > ./map-gen-settings.json << EOF
{
  "_terrain_segmentation_comment": "The inverse of 'water scale' in the map generator GUI.",
  "terrain_segmentation": ${TERRAIN_SEGMENTATION:-1},

  "_water_comment":
  [
    "The equivalent to 'water coverage' in the map generator GUI. Higher coverage means more water in larger oceans.",
    "Water level = 10 * log2(this value)"
  ],
  "water": ${WATER:-1},

  "_comment_width+height": "Width and height of map, in tiles; 0 means infinite",
  "width": ${WIDTH:-0},
  "height": ${HEIGHT:-0},

  "_starting_area_comment": "Multiplier for 'biter free zone radius'",
  "starting_area": ${STARTING_AREA:-1},

  "peaceful_mode": ${PEACEFUL_MODE:-false},
  "autoplace_controls":
  {
    "coal": {"frequency": ${COAL_FREQUENCY:-1}, "size": ${COAL_SIZE:-1}, "richness": ${COAL_RICHNESS:-1}},
    "stone": {"frequency": ${STONE_FREQUENCY:-1}, "size": ${STONE_SIZE:-1}, "richness": ${STONE_RICHNESS:-1}},
    "copper-ore": {"frequency": ${COPPER_FREQUENCY:-1}, "size": ${COPPER_SIZE:-1},"richness": ${COPPER_RICHNESS:-1}},
    "iron-ore": {"frequency": ${IRON_FREQUENCY:-1}, "size": ${IRON_SIZE:-1}, "richness": ${IRON_RICHNESS:-1}},
    "uranium-ore": {"frequency": ${URANIUM_FREQUENCY:-1}, "size": ${URANIUM_SIZE:-1}, "richness": ${URANIUM_RICHNESS:-1}},
    "crude-oil": {"frequency": ${CRUDE_FREQUENCY:-1}, "size": ${CRUDE_SIZE:-1}, "richness": ${CRUDE_RICHNESS:-1}},
    "trees": {"frequency": ${TREES_FREQUENCY:-1}, "size": ${TREES_SIZE:-1}, "richness": ${TREES_RICHNESS:-1}},
    "enemy-base": {"frequency": ${ENEMY_FREQUENCY:-1}, "size": ${ENEMY_SIZE:-1}, "richness": ${ENEMY_RICHNESS:-1}}
  },

  "cliff_settings":
  {
    "_name_comment": "Name of the cliff prototype",
    "name": "${CLIFF_NAME:-cliff}",

    "_cliff_elevation_0_comment": "Elevation of first row of cliffs",
    "cliff_elevation_0": ${CLIFF_ELEVATION:-10},

    "_cliff_elevation_interval_comment":
    [
      "Elevation difference between successive rows of cliffs.",
      "This is inversely proportional to 'frequency' in the map generation GUI. Specifically, when set from the GUI the value is 40 / frequency."
    ],
    "cliff_elevation_interval": ${CLIFF_ELEVATION_INTERVAL:-40},

    "_richness_comment": "Called 'cliff continuity' in the map generator GUI. 0 will result in no cliffs, 10 will make all cliff rows completely solid",
    "richness": ${CLIFF_RICHNESS:-1}
  },

  "_property_expression_names_comment":
  [
    "Overrides for property value generators (map type)",
    "Leave 'elevation' blank to get 'normal' terrain.",
    "Use 'elevation': '0_16-elevation' to reproduce terrain from 0.16.",
    "Use 'elevation': '0_17-island' to get an island.",
    "Moisture and terrain type are also controlled via this.",
    "'control-setting:moisture:frequency:multiplier' is the inverse of the 'moisture scale' in the map generator GUI.",
    "'control-setting:moisture:bias' is the 'moisture bias' in the map generator GUI.",
    "'control-setting:aux:frequency:multiplier' is the inverse of the 'terrain type scale' in the map generator GUI.",
    "'control-setting:aux:bias' is the 'teraain type bias' in the map generator GUI."
  ],
  "property_expression_names":
  {
    "control-setting:moisture:frequency:multiplier": "${CONTROL_SETTING_MOISTURE_FREQUENCY_MULTIPLIER:-1}",
    "control-setting:moisture:bias": "${CONTROL_SETTING_MOISTURE_BIAS:-0}",
    "control-setting:aux:frequency:multiplier": "${CONTROL_SETTING_AUX_FREQUENCY_MULTIPLIER:-1}",
    "control-setting:aux:bias": "${CONTROL_SETTING_AUX_BIAS:-0}"
  },

  "starting_points":
  [
    { "x": ${STARTING_POINT_X:-0}, "y": ${STARTING_POINT_Y:-0}}
  ],

  "_seed_comment": "Use null for a random seed, number for a specific seed.",
  "seed": ${SEED:-null}
}
EOF