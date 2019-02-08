private float fractionLength = .85; //1
private float smallestBranch = 7.0; //2
private float branchAngle = .3; //3
private float startBranchSize = 50.0; //4
private int ftColorMode = 1;
private float[][][] colorModes = new float[][][]{new float[][]{new float[]{4, 1, 7, -1}, new float[]{0, 100}, new float[]{0, 100}, new float[]{7, 1}}, new float[][]{new float[]{5, 1}, new float[]{6, 1}, new float[]{7, 1}, new float[]{0, 100}}, new float[][]{new float[]{0, 255, 8, -50}, new float[]{0, 128}, new float[]{0, 255, 7, -5}}};

public void setup()
{
  size(500, 500);
  noLoop();
}

public void draw()
{
	background(0);
	stroke(0,255,0);
  colorMode(HSB, startBranchSize);
  drawBranches((float)width/2, (float)height, startBranchSize, 0);
}

//5, 6, 7, 8
public void drawBranches(float x, float y, float branchLength, float angle)
{
  float finalBranchX = x+(float)Math.sin(angle)*branchLength;
  float finalBranchY = y-(float)Math.cos(angle)*branchLength;
  //stroke(x, y, branchLength);
  //stroke(255-(50*angle), 128, 255-(branchLength*5));
  stroke(startBranchSize-branchLength, 100, 100, branchLength);

  float[][] currentColorMode = colorModes[ftColorMode];
  float[] calculatedColorValues = calculateColorValues(currentColorMode, x, y, branchLength, angle);
  //stroke(calculatedColorValues[0], calculatedColorValues[1], calculatedColorValues[2], calculatedColorValues[3]);

	line(x, y, finalBranchX, finalBranchY);

  if (branchLength < smallestBranch) return;

  drawBranches(finalBranchX, finalBranchY, branchLength*fractionLength, angle+branchAngle);
  drawBranches(finalBranchX, finalBranchY, branchLength*fractionLength, angle-branchAngle);
}

public void keyPressed()
{
  if (keyCode == 32)
  {
    ftColorMode++;
    //if (ftColorMode > )
  }
}

public float[] calculateColorValues(float[][] colorMode, float x, float y, float branchLength, float angle)
{
  float[] valuesToUse = new float[]{1.0, fractionLength, smallestBranch, branchAngle, startBranchSize, x, y, branchLength, angle};
  float[] colorValues = new float[]{0.0, 0.0, 0.0, 0.0};

  for (int i=0; i < 4; i++)
  {
    for (int j=0; j < colorMode[i].length; j+=2)
    {
      float valueToUse = valuesToUse[(int)colorMode[i][j]]*colorMode[i][j+1];
      colorValues[i] = colorValues[i] + valueToUse;
    }
  }

  return colorValues;
}
