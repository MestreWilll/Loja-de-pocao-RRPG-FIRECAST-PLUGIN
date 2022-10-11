require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_Loja_Para_Pocao()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", rawget(obj, "setNodeObject"));

    function obj:setNodeObject(nodeObject)
        sheet = nodeObject;
        self.sheet = nodeObject;
        self:_oldSetNodeObjectFunction(nodeObject);
    end;

    function obj:setNodeDatabase(nodeObject)
        self:setNodeObject(nodeObject);
    end;

    _gui_assignInitialParentForForm(obj.handle);
    obj:beginUpdate();
    obj:setFormType("sheetTemplate");
    obj:setDataType("Loja_pocao_aqui");
    obj:setTitle("Loja_de_Pocao");
    obj:setName("Loja_Para_Pocao");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newLoja_Para_Pocao()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_Loja_Para_Pocao();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _Loja_Para_Pocao = {
    newEditor = newLoja_Para_Pocao, 
    new = newLoja_Para_Pocao, 
    name = "Loja_Para_Pocao", 
    dataType = "Loja_pocao_aqui", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Loja_de_Pocao", 
    description=""};

Loja_Para_Pocao = _Loja_Para_Pocao;
Firecast.registrarForm(_Loja_Para_Pocao);
Firecast.registrarDataType(_Loja_Para_Pocao);

return _Loja_Para_Pocao;
