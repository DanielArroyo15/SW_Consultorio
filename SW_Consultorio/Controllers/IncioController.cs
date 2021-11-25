using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using SW_Consultorio.Models;

namespace SW_Consultorio.Controllers
{
    public class IncioController : Controller
    {
        // GET: Incio
        public ActionResult Index()
        {
            if (Session["Usuario"] == null)
                return RedirectToAction("Index", "Login");

            List<Paciente> lst;

            try
            {

                using (DB_SWCDEntities db = new DB_SWCDEntities())
                {
                    lst = (from p in db.Paciente
                           select p).ToList();
                }
                ViewBag.Pacientes = lst.Count;
                return View(lst);

            } catch (Exception ex)
            {
                ViewBag.Error = ("" + ex);
            }
            return View();            
        }
    }
}