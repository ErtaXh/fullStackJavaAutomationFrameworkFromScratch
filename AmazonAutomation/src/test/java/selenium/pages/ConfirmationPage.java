package selenium.pages;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class ConfirmationPage  extends BasePage {

    @FindBy(xpath = "//a[contains(text(),'Go to Cart')][1]")
    WebElement goToCartElement;


    public CartPage goToCart() {
        goToCartElement.click();
        return new CartPage();
    }
}
