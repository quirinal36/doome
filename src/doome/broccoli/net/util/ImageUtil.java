package doome.broccoli.net.util;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.util.logging.Logger;

public class ImageUtil {
	Logger logger = Logger.getLogger(ImageUtil.class.getSimpleName());
	
	private static final int IMG_WIDTH = 1000;
	private static final int IMG_HEIGHT = 1000;
	
	public BufferedImage resizeImage(BufferedImage originalImage, int type){
		int height = originalImage.getHeight();
		int width  = originalImage.getWidth();
		
		logger.info("width::"+width+"//height::"+height);
		
		BufferedImage img = setMaxSizeImage(originalImage, width, height, type);
        
		return img;
	}
	
	private BufferedImage setMaxSizeImage(BufferedImage originalImage, int width, int height, int type) {
		if(width > IMG_WIDTH && width > height) {
			height = (int)(height * ((double)IMG_WIDTH/width));
			width = IMG_WIDTH;			
		}else if(height > IMG_HEIGHT && height > width) {
			width = (int)(width * ((double)IMG_HEIGHT/height));
			height = IMG_HEIGHT;
		}
		
		Image img = originalImage.getScaledInstance(width, height, Image.SCALE_DEFAULT);
		BufferedImage resized = new BufferedImage(width, height, type);
        Graphics2D g2d = resized.createGraphics();
        g2d.drawImage(img, 0, 0, null);
        g2d.dispose();
        g2d.setComposite(AlphaComposite.Src);
        g2d.setRenderingHint(RenderingHints.KEY_INTERPOLATION,
        		RenderingHints.VALUE_INTERPOLATION_BILINEAR);
        g2d.setRenderingHint(RenderingHints.KEY_RENDERING,
        		RenderingHints.VALUE_RENDER_QUALITY);
        g2d.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
        		RenderingHints.VALUE_ANTIALIAS_ON);
        return resized;
	}
}
