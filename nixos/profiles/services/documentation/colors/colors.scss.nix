$grey:         #707070; // Sonic Silver
$orange:       #f25511; // International Orange
$yellow:       #ffc533; // Mikado Yellow
$green:        #0aae41; // Green Pantone
$turquoise:    #178C81; // Celadon Green
$blue:         #00a1e0; // Carolina Blue
$purple:       #56507C; // Purple Navy
$red:          #9f1928; // Ruby Red
$pink:         #d930ac; // Frostbite
$white:        #ffffff;
$black:        #2e2a31; // Raisin Black

$primary:      $orange;

$grey-light:    lighten($grey, 10%);
$grey-lighter:  lighten($grey, 20%);
// $white:        #eaf2ef;              // Mint Cream


//// make colors available in htlm element
:root{
    --color-grey:		#{$grey};          // Sonic Silver
    --color-orange:		#{$orange};        // International Orange
    --color-yellow:		#{$yellow};        // Mikado Yellow
    --color-green:		#{$green};         // Green Pantone
    --color-turquoise:		#{$turquoise};     // Celadon Green
    --color-blue:		#{$blue};          // Carolina Blue
    --color-purple:		#{$purple};        // Purple Navy
    --color-red:		#{$red};           // Ruby Red
    --color-pink:		#{$pink};          // Frostbite
    --color-white:		#{$white};
    --color-black:		#{$black};         // Raisin Black

    --color-primary:		#{$orange};

    --color-grey-light:		#{lighten($grey, 10%)};
    --color-grey-lighter:	#{lighten($grey, 20%)};
}

//// ORIG
//
// $grey: #8c9b9d;
// $grey-light: #a9afb7;
// $grey-lighter: #dee2e5;
// $orange: #e67e22;
// $yellow: #f1b70e;
// $green: #2ecc71;
// $turquoise: #1abc9c;
// $blue: #3498db;
// $purple: #8e44ad;
// $red: #e74c3c;
// $white: #ecf0f1;
// $primary: #34495e !default;
