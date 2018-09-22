# Guillaume's workshops - LSTM-RNN

Ce workshop porte sur les réseaux de neurones artificiels, plus spécifiquement, les réseaux de neurones récurrents (RNNs). Premièrement, la théorie nécessaire à une compréhension de base sera couverte. Deuxièmement, les participants sont amenés à expérimenter avec les LSTMs (un RNN amélioré), avec Python.


### Comment utiliser et rouler le code

1. Clonez le projet suivant: https://github.com/guillaume-chevalier/LSTM-Human-Activity-Recognition
  - Par SSH: `git clone git@github.com:guillaume-chevalier/LSTM-Human-Activity-Recognition.git`
  - Par HTTPS: `git clone https://github.com/guillaume-chevalier/LSTM-Human-Activity-Recognition.git`
2. Installez les dépendances suivantes:
```
pip3 install numpy
pip3 install matplotlib
pip3 install tensorflow
pip3 install sklearn
```
3. Optionnellement, installez aussi Jupyter Notebook ou iPython notebook (`pip3 install ipython` et/ou `pip3 install jupyter`).
4. Vous pouvez maintenant faire rouler le code!
  - Sans iPython notebook, vous pouvez rouler le fichier lstm.py avec la commande `python3 lstm.py` lorsque dans le dossier du projet.
  - Avec iPython notebook, vous pouvez faire la commande `ipython notebook` ou `ipython3 notebook` dans le dossier du projet, et puis ouvrir le fichier `LSTM.ipynb` dans votre navigateur, roulez des cellules de code avec `CTRL+ENTER` ou `SHIFT+ENTER` par exemple.

_Notes sur les versions des librairies:_
- La version la plus récente de TensorFlow fonctionne, soit 1.4.0, (même si le projet a été programmé avec la version 1.0.0).
- Bien que programmé en Python 3 (pip3), c'est fort probablement rétrocompatible avec une installation en Python 2 (pip).
- Une installation avec un GPU, tensorflow-gpu, et les drivers Nvidia n'est pas requise ici, mais peut améliorer les vitesses de calcul.
