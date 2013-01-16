package  
{
    import org.flixel.*;
	import com.Tutorial.MenuState;

    [SWF(width="640", height="480", backgroundColor="#000000")]
    [Frame(factoryClass="Preloader")]

    public class Tutorial extends FlxGame
    {
        public function Tutorial():void
        {
            super(320, 240, MenuState, 2);
			FlxState.bgColor = 0xff888888;
        }  
    }
}