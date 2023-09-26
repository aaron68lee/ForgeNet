# ForgeNet
A deep learning framework to generate realistic handwriting samples

Sources: 

[Handwriting Generation](https://github.com/herobd/handwriting_line_generation)<br>
[Convolutional-GAN](https://github.com/amzn/convolutional-handwriting-gan)<br>

@inproceedings{fogel2020scrabblegan,
    title={ScrabbleGAN: Semi-Supervised Varying Length Handwritten Text Generation},
    author={Sharon Fogel and Hadar Averbuch-Elor and Sarel Cohen and Shai Mazor and Roee Litman},
    booktitle = {The IEEE Conference on Computer Vision and Pattern Recognition (CVPR)},
    month = {June},
    year = {2020}
}

# Data Processing Pipeline

We first decided on datasets build a data loader to clean data into a desired form. In this case, we generated a dictionary that maps image filepath to their corresponding texts. <br>i.e. (a01/a01-00/a01-00-000u-01.png -> "World") 

Then we preprocessed images data so that they can be readily fed into the model. processed_data is in `filtered_data` and is a list of tensor object with shape of image dimension.

# Project Presentation
[Presentation Files](https://drive.google.com/drive/folders/1RFYHmylaNnWQmpju8Mp7Ws3sx41Fa9uK?usp=drive_link)
