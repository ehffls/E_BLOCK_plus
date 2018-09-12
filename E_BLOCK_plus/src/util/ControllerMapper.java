package util;


import org.apache.log4j.Logger;

import eblock.a_controller.AttitudeController;
import eblock.a_controller.BudgetController;
import eblock.a_controller.Controller;
import eblock.a_controller.EmpController;
import eblock.a_controller.EquipController;

public class ControllerMapper {

	static Logger logger = Logger.getLogger(ControllerMapper.class);
	
	public static Controller getController(String command) {
		logger.info("getControl 호출 성공");
		Controller control = null;
		
		command = command.replace(".ebp", "");
		String[] commands = command.split("/");
		if(commands.length==3) {
			String category = commands[0];
			String work = commands[1];
			String crud = commands[2];
			
			if(category.equals("budget")) {
				control = new BudgetController(work,crud);
			} 
			else if(category.equals("commute")) {
				control = new AttitudeController(work,crud);
			} 
			else if(category.equals("emp")) {
				control = new EmpController(work,crud);
			}
			else if(category.equals("equip")) {
				control = new EquipController(work,crud);
			}
		}
		else {
			logger.info("controller 매핑 실패");
		}
		
		return control;
	}
}
