private float fractionLength = .8;
private float smallestBranch = 5.0;
private float branchAngle = .4;

public void setup()
{
  size(300, 300);
  frameRate(2);
  //currentBranchData = new float[]{(float)width/2, (float)height, 50.0, 0};
}

//public float[] currentBranchData;
public float endingBranchLength = 50;

public void draw()
{
	//background(0);
	stroke(0,255,0);
  drawBranches((float)width/2, (float)height, 50.0, 0);
  //currentBranchData = drawBranches(currentBranchData[0], currentBranchData[1], currentBranchData[2], currentBranchData[3]);
	//drawBranches((float)width/2, (float)height, 50.0, 0);
}

public void drawBranches(float x, float y, float branchLength, float angle)
{
  float finalBranchX = x+(float)Math.sin(angle)*branchLength;
  float finalBranchY = y-(float)Math.cos(angle)*branchLength;
	line(x, y, finalBranchX, finalBranchY);

  //if (branchLength < smallestBranch) currentBranchData = new float[]{(float)width/2, (float)height, 50.0, 0};
  println(branchLength, endingBranchLength);
  if (branchLength < endingBranchLength)
  {
    endingBranchLength = branchLength*0.9;
    return;
  }

  if (branchLength < 5)
  {
    endingBranchLength = 50;
    return;
  }

  //return new float[]{finalBranchX, finalBranchY, branchLength*fractionLength, angle+branchAngle};

  //if (branchLength < smallestBranch) return;

  drawBranches(finalBranchX, finalBranchY, branchLength*fractionLength, angle+branchAngle);
  drawBranches(finalBranchX, finalBranchY, branchLength*fractionLength, angle-branchAngle);
}
