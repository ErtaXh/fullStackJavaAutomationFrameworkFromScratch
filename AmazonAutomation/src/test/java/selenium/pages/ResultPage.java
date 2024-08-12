package selenium.pages;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.FindBy;

import java.util.List;

public class ResultPage extends BasePage{

    @FindBy(xpath = "//div[@data-component-type='s-search-result']")
    List<WebElement> resultProductsElements;

    public ProductDetailsPage clickResultProduct(Integer index){

        resultProductsElements.get(index).click();
        return new ProductDetailsPage();
        }
    }

