<h3>Summary</h3>
<p>This project demonstrates a method for solving electrical dc
circuits from an image. Methods of computer vision are used throughout
the programm.
</p>
<p>
The programm is at an initial stage and the only circuit images, which the programm
can solve, are the ones in the directory ./images
</p>
<p>
However, this is a first demonstration of the way that a programm can analyse a circuit 
from an image. Imagine if you only could solve an electrical circuit by taking a photo
with your smartphone, it would make the life of the electrical engineering student much
easier, especially whenever he writes an exam on circuit analysis.
</p>
<hr>
<h3>Structure</h3>
<p>The directories are based on the stage of computer vision analysis.
The main directories are listed bellow:
<ul>
<li><b>recognize</b> contains methods to recognize the patterns on the image</li>
<li><b>ocr_manipulations</b> is used to recognize characters on the image</li>
<li><b>nodes_and_centers</b> finds the topology, this is the way elements are connected</li>
<li><b>node_analysis</b> contains all the methods to solve the circuit</li>
</ul>
</p>
<hr>
<h3>How to run it</h3>
<p>Run the programm from the PROJECT.m script, change the variable cir_number to choose
which circuit (1 to 8 because we have 8 circuit images) you want to solve. The programm 
can solve only the 5 of the 8 images (the 1, 2, 3, 5 and 6), this is 62.5% success on circuit solving.</p>