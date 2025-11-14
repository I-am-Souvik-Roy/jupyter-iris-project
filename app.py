import streamlit as st
import joblib
from sklearn.datasets import load_iris

# Load model
model = joblib.load("scripts/iris_rf_model.joblib")

iris = load_iris()

st.title("🌸 Iris Flower Prediction App")

sepal_length = st.slider("Sepal Length", 4.0, 8.0)
sepal_width = st.slider("Sepal Width", 2.0, 4.5)
petal_length = st.slider("Petal Length", 1.0, 7.0)
petal_width = st.slider("Petal Width", 0.1, 3.0)

if st.button("Predict"):
    pred = model.predict([[sepal_length, sepal_width, petal_length, petal_width]])
    st.success(f"Prediction: {iris.target_names[pred[0]]}")