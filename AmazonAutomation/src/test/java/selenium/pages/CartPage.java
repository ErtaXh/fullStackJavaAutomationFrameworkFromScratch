package selenium.pages;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

public class CartPage extends BasePage {

    @FindBy(css = ".sc-product-price ")
    WebElement productPriceElement;

    @FindBy(id="sc-subtotal-amount-activecart")
    WebElement totalPriceElement;

    public double getProductPrice(){
        return Double.parseDouble(productPriceElement.getText().replace("$",""));
    }

    public  double getTotalPrice(){
        return Double.parseDouble(totalPriceElement.getText().replace("$",""));

    }
}
