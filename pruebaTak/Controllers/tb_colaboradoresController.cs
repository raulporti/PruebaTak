using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using pruebaTak;

namespace pruebaTak.Controllers
{
    public class tb_colaboradoresController : Controller
    {
        private pruebaTakEntities db = new pruebaTakEntities();

        // GET: tb_colaboradores
        public ActionResult Index()
        {
            return View(db.tb_colaboradores.ToList());
        }

        // GET: tb_colaboradores/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tb_colaboradores tb_colaboradores = db.tb_colaboradores.Find(id);
            if (tb_colaboradores == null)
            {
                return HttpNotFound();
            }
            return View(tb_colaboradores);
        }

        // GET: tb_colaboradores/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: tb_colaboradores/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "id,nombre,apellido,fecha_nacimiento,estado_civil,grado_academico")] tb_colaboradores tb_colaboradores)
        {
            if (ModelState.IsValid)
            {
                db.tb_colaboradores.Add(tb_colaboradores);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tb_colaboradores);
        }

        // GET: tb_colaboradores/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tb_colaboradores tb_colaboradores = db.tb_colaboradores.Find(id);
            if (tb_colaboradores == null)
            {
                return HttpNotFound();
            }
            return View(tb_colaboradores);
        }

        // POST: tb_colaboradores/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que quiere enlazarse. Para obtener 
        // más detalles, vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "id,nombre,apellido,fecha_nacimiento,estado_civil,grado_academico")] tb_colaboradores tb_colaboradores)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tb_colaboradores).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tb_colaboradores);
        }

        // GET: tb_colaboradores/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            tb_colaboradores tb_colaboradores = db.tb_colaboradores.Find(id);
            if (tb_colaboradores == null)
            {
                return HttpNotFound();
            }
            return View(tb_colaboradores);
        }

        // POST: tb_colaboradores/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            tb_colaboradores tb_colaboradores = db.tb_colaboradores.Find(id);
            db.tb_colaboradores.Remove(tb_colaboradores);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
