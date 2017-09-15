package SpringBoot;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Sample Rest Controller
 */
@RestController
public class SpringBootController {

  @GetMapping(value = "/")
  public String greetings(){
    return "Hello, World!";
  }

}
