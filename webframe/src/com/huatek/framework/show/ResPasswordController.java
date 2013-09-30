package com.huatek.framework.show;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.huatek.framework.entity.FwAccount;
import com.huatek.framework.security.ThreadLocalClient;
import com.huatek.framework.service.AccountService;
import com.huatek.framework.util.CommonUtil;
import com.huatek.framework.util.EncryptService;
import com.huatek.framework.util.Util;
import com.huatek.framework.validate.ValidateFieldLength;

/**
 * 本类完成系统用户的密码修改
 *
 * @author Joey_deng
 *
 */
@Controller
@RequestMapping("/resPassword.show")
@SessionAttributes(types = FwAccount.class)
class ResPasswordController {
    /**
     * 用户服务接口.
     */
    @Autowired
    private AccountService userService;
	@Autowired
	EncryptService encryptServiceImpl;


    /**
     *
     * @param model SpringMVC框架中的Model对象
     * @return 返回到用户密码修改页面
     */
    @RequestMapping(params = "actionMethod=edit", method = RequestMethod.GET)
    public String resPassword(final Model model) {
        model.addAttribute(new FwAccount());
        return "frame/account/password_edit.jsp";
    }

    /**
     *
     * @param user 用户的对象
     * @param result 校验的结果
     * @param status session的状态
     * @return 返回到密码修改页面
     */
    @RequestMapping(params = "actionMethod=edit", method = RequestMethod.POST)
    public String updatePwd(final Model model, @ModelAttribute final FwAccount user,
                            final BindingResult result, final SessionStatus status) {
        validate(user, result);
        if (result.hasErrors()) {
            return Util.printErrorString(Util.getErrorMsgInfo(result, "resPasswordForm"));
        }
        FwAccount account = ThreadLocalClient.get().getOperator();
		if (!account.getAcctPwd().equals(encryptServiceImpl.encrypt(user.getAcctPwd()))) {
            result.rejectValue("acctPwd", "resPasswordForm.acctPwd.default",
                new Object[] { user.getAcctPwd() }, "原密码输入不正确！");
            return Util.printErrorString(Util.getErrorMsgInfo(result, "resPasswordForm"));
        }
        if (!user.getNewPwd().equals(user.getComfirmPwd())) {
            result.rejectValue("newPwd", "resPasswordForm.newPwd.default",
                new Object[] { user.getNewPwd()}, "新密码和新密码确认输入不一致！");
            return Util.printErrorString(Util.getErrorMsgInfo(result, "resPasswordForm"));
        } else {
            userService.updatePwd(user);
        }
        return Util.printString("密码修改成功！");
    }

    /**
     * 数据校验.
     * @param user 用户对象
     * @param errors 错误信息对象
     */
    public static void validate(final FwAccount user, final Errors errors) {
        if (CommonUtil.isZeroLengthTrimString(user.getAcctPwd())) {
            errors.rejectValue("acctPwd", "required", "required");
        }
        if (CommonUtil.isZeroLengthTrimString(user.getNewPwd())) {
            errors.rejectValue("newPwd", "required", "required");
        }
        if (CommonUtil.isZeroLengthTrimString(user.getComfirmPwd())) {
            errors.rejectValue("comfirmPwd", "required", "required");
        }

        ValidateFieldLength.validateMaxLength(errors, "acctPwd", 100, "maxLimitLength",
            "Enter overflow.");
        ValidateFieldLength.validateMaxLength(errors, "newPwd", 100, "maxLimitLength",
            "Enter overflow.");
        ValidateFieldLength.validateMaxLength(errors, "comfirmPwd", 100, "maxLimitLength",
            "Enter overflow.");
    }
}
