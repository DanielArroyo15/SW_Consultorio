using System.Data.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SW_Consultorio.Models;

namespace SW_Consultorio.Controllers
{
    public class LoginController : Controller
    {
        private DB_SWCDEntities db = new DB_SWCDEntities();

        // GET: Login
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Index(string usuario, string clave)
        {
         try
            {
                var oUsuario = (from us in db.Usuario
                                where us.Usuario1 == usuario && us.Clave == clave && us.PerfilID != 4
                                select us).FirstOrDefault();
                if (oUsuario == null)
                {
                    ViewBag.Error = "Usuario o contraseña incorrecta";
                    return View("Index");
                }
                else
                    Session["Usuario"] = oUsuario;
                return RedirectToAction("Index", "Incio");
            }
            catch (Exception ex)
            {
                ViewBag.Error = "" + ex;
            }
            return RedirectToAction("Index");
        }
    }
}