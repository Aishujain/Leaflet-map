# Leaflet-map

# Hospital Location Map in Victoria

This project uses Leaflet, a JavaScript library for interactive maps, to display the locations of hospitals in Victoria, Australia. The map is created using R, specifically the Leaflet package.

## Map Functionality

- The map displays hospital locations in Victoria.
- When zoomed out, hospitals are clustered together for a better overview.
- As you zoom in, the clusters spread out, revealing individual hospitals.
- Each hospital is represented by a marker on the map.
- Hovering over a hospital marker shows a tooltip with the hospital's name, type, location, and a link to the official hospital website.
- The hospital types are color-coded: red for private hospitals and blue for public hospitals.
- filter function lets you filter hospital location based on suburbed selected.

## Prerequisites

To run the map locally, you need to have the following software installed:

- R
- Leaflet package in R
- tidyverse package in R
- shiny package in R
- shinyWidgets package in R

## Usage

1. Clone the repository to your local machine.
2. Open the R script file (`leaflet_map.R`).
3. Run the script in R to generate the hospital location map.
4. The map will be displayed and can be interacted with in the R environment.

<img width="671" alt="image" src="https://github.com/Aishujain/Leaflet-map/assets/88078946/afb4f538-0ac9-467a-b3fb-944be41c3fed">


## Contributing

Contributions to improve the map or add new features are welcome! If you find any issues or have suggestions, please feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgements

- The hospital data used in this map is sourced from https://discover.data.vic.gov.au/dataset/hospital-locations-spatial.
- This has been used for my university final year project type2thrive to help diabetic patients with type 2 diabetes.



