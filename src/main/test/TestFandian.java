import com.dan.controller.MainController;
import com.dan.data.FandianData;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "file:src/main/webapp/WEB-INF/dispatcher-servlet.xml")
public class TestFandian {

    private MainController mainController;

    @Test
    public void getFandinResourceFile(){
        if (mainController!=null){
            System.out.println("system out==>"+mainController.getFandian());
        }
    }

    @Test
    public void setFandinFile(){
        if (mainController!=null){
            List<FandianData> fandianData=new ArrayList<>();
            for (int i = 0; i < 2; i++) {
//                FandianData fandianData1=new FandianData();
//                fandianData1.brandName="brand"+i;
//                fandianData1.fandian=1.1;
//                fandianData.add(fandianData1);
            }
//            mainController.updateFandian(fandianData);
        }
    }

    @Autowired
    public void setMainController(MainController mainController) {
        this.mainController = mainController;
    }
}
