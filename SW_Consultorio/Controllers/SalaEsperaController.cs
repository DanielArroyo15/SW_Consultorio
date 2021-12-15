using SW_Consultorio.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SW_Consultorio.Controllers
{
    public class SalaEsperaController : Controller
    {
        private DB_SWCDEntities db = new DB_SWCDEntities();
        // GET: SalaEspera
        public ActionResult Index()
        {
            return View(db.SP_ObtenerLlamados().ToList());
        }
    }
}