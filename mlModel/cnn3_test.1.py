import pandas as pd
import numpy as np
import tensorflow as tf
from keras.preprocessing.image import ImageDataGenerator
import matplotlib.pyplot as plt
import cv2
import os

cnn = tf.keras.models.load_model('C:/Coding/HackFest_Galacticos/Actual Stuf/trained_plant_disease_model.keras')

validation_set = tf.keras.utils.image_dataset_from_directory('C:/Coding/HackFest_Galacticos/Dataset/New Plant Diseases Dataset(Augmented)/New Plant Diseases Dataset(Augmented)/valid',
    labels="inferred",
    label_mode="categorical",
    class_names=None,
    color_mode="rgb",
    batch_size=32,
    image_size=(128, 128),
    shuffle=True,
    seed=None,
    validation_split=None,
    subset=None,
    interpolation="bilinear",
    follow_links=False,
    crop_to_aspect_ratio=False
)
class_name = validation_set.class_names

path = 'C:/Coding/HackFest_Galacticos/Test_Images'
image = os.listdir(path)
path = path + '/' + image[0]

img = cv2.imread(path)
img = cv2.cvtColor(img,cv2.COLOR_BGR2RGB)
plt.imshow(img)
plt.title('Test Image')
plt.xticks([])
plt.yticks([])

image = tf.keras.preprocessing.image.load_img(path,target_size=(128,128))
input_arr = tf.keras.preprocessing.image.img_to_array(image)
input_arr = np.array([input_arr])
predictions = cnn.predict(input_arr)

result_index = np.argmax(predictions)
model_prediction = class_name[result_index]
plt.imshow(img)
plt.title(f"Disease Name: {model_prediction}")
plt.xticks([])
plt.yticks([])
plt.show()


url = "C:/Coding/HackFest_Galacticos/treatment.csv"
df = pd.read_csv(url)

def get_disease_info(disease_name):
    if disease_name in df['DISEASE_NAME'].values:
        disease_info = df[df['DISEASE_NAME'] == disease_name].iloc[0]
        cause = disease_info['CAUSE']
        cure = disease_info['CURE']
        medicine = disease_info['MEDICINE']
        why = disease_info['WHY']
        if 'healthy'in disease_name :
            print(f"Name: {disease_name}")
            print(f"maintance: {cure}")
        else:
            print(f"Disease name: {disease_name}")
            print(f"Cause: {cause}")
            print(f"Cure/treatment: {cure}")
            print(f"Medication: {medicine}")
            print(f"Why: {why}")
    else:
        print("Disease not found.")

disease_name = class_name[result_index]

get_disease_info(disease_name)

os.remove(path)

