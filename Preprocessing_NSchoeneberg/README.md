# Preprocessing of large .czi files

In order to ultimately analyze the images with [deepflash2](https://github.com/matjesg/deepflash2), 
each image z-stack had to be processed to create a maximum intensity projection of both individual channels.
For the purpose of documentation and potentially visualization, both max. projections were also merged and saved as RGB.

The macro automatically does the processing, while handling multiple images that are opened simultaneously, 
creates a more convenient image_id for each file, and also takes care of the assignment documentation
