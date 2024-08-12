package selenium.pages;

import org.openqa.selenium.By;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;
import selenium.utils.Driver;

import java.time.Duration;

public class ProductDetailsPage extends BasePage{

    @FindBy(id="quantity")
    WebElement quanityElement;

    @FindBy(id="add-to-cart-button")
    WebElement addToCartElement;

    public boolean checkQuantityIsDisplayed(){
        return quanityElement.isDisplayed();
    }

    public boolean checkAddToCartIsDisplayed(){
        return  addToCartElement.isDisplayed();
    }

public void selectQuantity(String quantity){

            WebDriverWait wait = new WebDriverWait(Driver.getDriver(), Duration.ofSeconds(10)); // Adjust timeout as needed
            wait.until(ExpectedConditions.elementToBeClickable(quanityElement));

            Select quantityDropdown = new Select(quanityElement);
            quantityDropdown.selectByVisibleText(quantity);
            Driver.getDriver().findElement(By.tagName("body")).click();


}

public ConfirmationPage clickAddToCartButton(){
   addToCartElement.click();

return new ConfirmationPage();
}




}
