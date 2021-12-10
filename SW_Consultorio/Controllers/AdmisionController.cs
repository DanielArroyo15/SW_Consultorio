using SW_Consultorio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SW_Consultorio.Controllers
{
    public class AdmisionController : Controller
    {
        private DB_SWCDEntities db = new DB_SWCDEntities();
        // GET: Admision
        public ActionResult Index()
        {
            return View(db.SP_ObtenerCitados().ToList());
        }

        public JsonResult CambiaCitaAdmision(int id)
        {
            bool respuesta = true;


            try
            {
                if (id != 0)
                {
                    db.SP_CitaAdmision(id);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                respuesta = false;
            }

            return Json(new { resultado = respuesta }, JsonRequestBehavior.AllowGet);
        }
        
    }
}